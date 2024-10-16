return {
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = true,  -- disable when recording or executing a macro
    disable_in_visualblock = true, -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    enable_bracket_in_quote = true, --
    enable_abbr = false, -- trigger abbreviation
    break_undo = true, -- switch for basic rule break undo sequence
    check_ts = false,
    map_cr = true,
    map_bs = true,  -- map the <BS> key
    map_c_h = false,  -- Map the <C-h> key to delete a pair
    map_c_w = true, -- map <c-w> to delete a pair if possible
    fast_wrap = {},
  },
},

{
	"L3MON4D3/LuaSnip",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  opts = {
  },
  config = function(_, opts)
    local ls = require("luasnip")
    -- load snippets source
    require("luasnip.loaders.from_vscode").lazy_load({})
  end,
},

{
	"saadparwaiz1/cmp_luasnip",
},

{
  "petertriho/cmp-git",
  dependencies = {
    'hrsh7th/nvim-cmp',
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = {
    sources = {
      { name = "git" },
      -- more sources
    },
    -- defaults
    filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
    remotes = { "upstream", "origin" }, -- in order of most to least prioritized
    enableRemoteUrlRewrites = false, -- enable git url rewrites, see https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
    trigger_actions = {
      {
        debug_name = "git_commits",
        trigger_character = ":",
        action = function(sources, trigger_char, callback, params, git_info)
            return sources.git:get_commits(callback, params, trigger_char)
        end,
      },
      {
        debug_name = "github_issues_and_pr",
        trigger_character = "#",
        action = function(sources, trigger_char, callback, params, git_info)
            return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
        end,
      },
      {
        debug_name = "github_mentions",
        trigger_character = "@",
        action = function(sources, trigger_char, callback, params, git_info)
            return sources.github:get_mentions(callback, git_info, trigger_char)
        end,
      },
    },
  },
  config = function(_, opts)
    require("cmp_git").setup(require('utils').default_opts(opts){
      git = {
        commits = {
          limit = 100,
          sort_by = require("cmp_git.sort").git.commits,
          format = require("cmp_git.format").git.commits,
          sha_length = 7,
        },
      },
      github = {
        hosts = {"https://ghe.spotify.net"}, -- list of private instances of github
        issues = {
          fields = { "title", "number", "body", "updatedAt", "state" },
          filter = "all", -- assigned, created, mentioned, subscribed, all, repos
          limit = 100,
          state = "open", -- open, closed, all
          sort_by = require("cmp_git.sort").github.issues,
          format = require("cmp_git.format").github.issues,
        },
        mentions = {
          limit = 100,
          sort_by = require("cmp_git.sort").github.mentions,
          format = require("cmp_git.format").github.mentions,
        },
        pull_requests = {
          fields = { "title", "number", "body", "updatedAt", "state" },
          limit = 100,
          state = "open", -- open, closed, merged, all
          sort_by = require("cmp_git.sort").github.pull_requests,
          format = require("cmp_git.format").github.pull_requests,
        },
      },
    })
  end,
},

{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "petertriho/cmp-git",
    "onsails/lspkind.nvim",
    "brenoprata10/nvim-highlight-colors",
    "folke/lazydev.nvim",
    "windwp/nvim-autopairs",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end
    local cmp = require("cmp")
    cmp.setup({
      enabled = true,
      completion = {
        autocomplete = false,
      },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        -- completion = require("cmp").config.window.bordered(),
        -- documentation = require("cmp").config.window.bordered(),
      },
      formatting = {
        format = function(entry, item)
          local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
          item = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            }),
          })(entry, item)
          if color_item.abbr_hl_group then
            item.kind_hl_group = color_item.abbr_hl_group
            item.kind = color_item.abbr
          end
          return item
        end
      },
      performance = {
        max_view_entries = 15,
      },
      -- preselect = cmp.PreselectMode.Item,
      preselect = cmp.PreselectMode.None,
      experimental = {
        ghost_text = true -- this feature conflict with copilot.vim's preview.
      },
      sources = require("cmp").config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        -- { name = 'buffer', keyword_length = 2 },
        {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
      }),
      mapping = require("cmp").mapping.preset.insert({
        ['<C-Space>'] = require("cmp").mapping.complete(),
        ['<C-b>'] = require("cmp").mapping.scroll_docs(-4),
        ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
        ['<C-e>'] = require("cmp").mapping.abort(),
        ['<Esc>'] = require("cmp").mapping.abort(),
        ['<CR>'] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Right>'] = require("cmp").mapping.confirm({ select = true }),
        -- my mappings
         -- ["<CR>"] = cmp.mapping({
         --   i = function(fallback)
         --     if cmp.visible() and cmp.get_active_entry() then
         --       cmp.confirm({ select = false })
         --     elseif cmp.visible() and #cmp.get_entries() == 1 then
         --       cmp.confirm({ select = true })
         --     else
         --       fallback()
         --     end
         --   end,
         --   s = cmp.mapping.confirm({ select = false }),
         --   c = cmp.mapping.confirm({ select = false }),
         -- }),
        ['<Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<S-Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<Up>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<Down>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        -- ['<S-Tab>'] = function(fallback)
        --   if not cmp.select_prev_item() then
        --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end
        -- end,
        -- ['<Up>'] = cmp.mapping(function(fallback)
        --   if not cmp.select_prev_item() then
        --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end
        -- end, { 'i', 'c' }),
        --['<Down>'] = cmp.mapping(function(fallback)
        --  if not cmp.select_next_item() then
        --    if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --      cmp.complete()
        --    else
        --      fallback()
        --    end
        --  end
        --end, { 'i', 'c' }),
        --['<C-j>'] = cmp.mapping(function(fallback)
        --  if not cmp.select_next_item() then
        --    if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --      cmp.complete()
        --    else
        --      fallback()
        --    end
        --  end
        --end, { 'i', 'c' }),
        --['<C-k>'] = cmp.mapping(function(fallback)
        --  if not cmp.select_prev_item() then
        --    if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --      cmp.complete()
        --    else
        --      fallback()
        --    end
        --  end
        --end, { 'i', 'c' }),
        --['<M-j>'] = cmp.mapping(function(fallback)
        --  if not cmp.select_next_item() then
        --    if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --      cmp.complete()
        --    else
        --      fallback()
        --    end
        --  end
        --end, { 'i', 'c' }),
        --['<M-k>'] = cmp.mapping(function(fallback)
        --  if not cmp.select_prev_item() then
        --    if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --      cmp.complete()
        --    else
        --      fallback()
        --    end
        --  end
        --end, { 'i', 'c' }),
      }),
    })
    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    require("cmp").setup.filetype('gitcommit', {
      sources = require("cmp").config.sources(
        {
          { name = 'git' },
        }
        -- {
        --   { name = 'buffer' },
        -- }
      )
    })
    require("cmp_git").setup()
    vim.keymap.set({'i', 'c'}, '<C-k>', '<Up>', {})
    vim.keymap.set({'i', 'c'}, '<C-j>', '<Down>', {})
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    require("cmp").setup.cmdline({ '/', '?' }, {
      sources = {
        { name = 'buffer', group_index = 2 },
      },
      mapping = require("cmp").mapping.preset.cmdline({
        ['<CR>'] = require("cmp").mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert})
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<S-Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<Up>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<Down>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
      }),
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    require("cmp").setup.cmdline(':', {
      sources = require("cmp").config.sources(
        {
          { name = 'cmdline', group_index = 1 },
        }
        -- {
        --   { name = 'buffer', group_index = 2 },
        -- },
        -- {
        --   { name = 'path', group_index = 2 }
        -- }
      ),
      matching = { disallow_symbol_nonprefix_matching = false },
      mapping = require("cmp").mapping.preset.cmdline({
        ['<CR>'] = require("cmp").mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end, { 'i', 'c' }),
        ['<S-Tab>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end, { 'i', 'c' }),
        ['<Up>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<Down>'] = require("cmp").mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
        ['<M-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback()
          end
        end, { 'i', 'c' }),
      }),
    })
    -- add parens on function completions
    cmp.event:on(
      'confirm_done',
      require('nvim-autopairs.completion.cmp').on_confirm_done()
    )
  end,
},

}
