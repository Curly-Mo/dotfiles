return {
-- {
-- 	"L3MON4D3/LuaSnip",
-- 	-- follow latest release.
-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 	-- install jsregexp (optional!).
-- 	build = "make install_jsregexp"
-- },

-- {
-- 	"saadparwaiz1/cmp_luasnip",
-- },

-- {
--   "petertriho/cmp-git",
--   dependencies = { 'hrsh7th/nvim-cmp', "hrsh7th/cmp-nvim-lsp" },
--   opts = {
--     sources = {
--       { name = "git" },
--       -- more sources
--     },
--     -- defaults
--     filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
--     remotes = { "upstream", "origin" }, -- in order of most to least prioritized
--     enableRemoteUrlRewrites = false, -- enable git url rewrites, see https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
--     git = {
--       commits = {
--         limit = 100,
--         sort_by = require("cmp_git.sort").git.commits,
--         format = require("cmp_git.format").git.commits,
--         sha_length = 7,
--       },
--     },
--     github = {
--       hosts = {"https://ghe.spotify.net"}, -- list of private instances of github
--       issues = {
--         fields = { "title", "number", "body", "updatedAt", "state" },
--         filter = "all", -- assigned, created, mentioned, subscribed, all, repos
--         limit = 100,
--         state = "open", -- open, closed, all
--         sort_by = require("cmp_git.sort").github.issues,
--         format = require("cmp_git.format").github.issues,
--       },
--       mentions = {
--         limit = 100,
--         sort_by = require("cmp_git.sort").github.mentions,
--         format = require("cmp_git.format").github.mentions,
--       },
--       pull_requests = {
--         fields = { "title", "number", "body", "updatedAt", "state" },
--         limit = 100,
--         state = "open", -- open, closed, merged, all
--         sort_by = require("cmp_git.sort").github.pull_requests,
--         format = require("cmp_git.format").github.pull_requests,
--       },
--     },
--     gitlab = {
--       hosts = {},  -- list of private instances of gitlab
--       issues = {
--         limit = 100,
--         state = "opened", -- opened, closed, all
--         sort_by = require("cmp_git.sort").gitlab.issues,
--         format = require("cmp_git.format").gitlab.issues,
--       },
--       mentions = {
--         limit = 100,
--         sort_by = require("cmp_git.sort").gitlab.mentions,
--         format = require("cmp_git.format").gitlab.mentions,
--       },
--       merge_requests = {
--         limit = 100,
--         state = "opened", -- opened, closed, locked, merged
--         sort_by = require("cmp_git.sort").gitlab.merge_requests,
--         format = require("cmp_git.format").gitlab.merge_requests,
--       },
--     },
--     trigger_actions = {
--       {
--         debug_name = "git_commits",
--         trigger_character = ":",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.git:get_commits(callback, params, trigger_char)
--         end,
--       },
--       {
--         debug_name = "gitlab_issues",
--         trigger_character = "#",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.gitlab:get_issues(callback, git_info, trigger_char)
--         end,
--       },
--       {
--         debug_name = "gitlab_mentions",
--         trigger_character = "@",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.gitlab:get_mentions(callback, git_info, trigger_char)
--         end,
--       },
--       {
--         debug_name = "gitlab_mrs",
--         trigger_character = "!",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
--         end,
--       },
--       {
--         debug_name = "github_issues_and_pr",
--         trigger_character = "#",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
--         end,
--       },
--       {
--         debug_name = "github_mentions",
--         trigger_character = "@",
--         action = function(sources, trigger_char, callback, params, git_info)
--             return sources.github:get_mentions(callback, git_info, trigger_char)
--         end,
--       },
--     },
--   },
-- },

{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-cmdline",
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
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        -- completion = require("cmp").config.window.bordered(),
        -- documentation = require("cmp").config.window.bordered(),
      },
      mapping = require("cmp").mapping.preset.insert({
        ['<C-b>'] = require("cmp").mapping.scroll_docs(-4),
        ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
        ['<C-Space>'] = require("cmp").mapping.complete(),
        ['<C-e>'] = require("cmp").mapping.abort(),
        ['<CR>'] = require("cmp").mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- my mappings
        ['<Tab>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<C-j>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<C-k>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<M-j>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ['<M-k>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
      }),
      sources = require("cmp").config.sources(
        {
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        },
        {
          { name = 'buffer' },
        }
      )
    })
    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ require("cmp").setup.filetype('gitcommit', {
      sources = require("cmp").config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })
    require("cmp_git").setup() ]]-- 
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    require("cmp").setup.cmdline({ '/', '?' }, {
      mapping = require("cmp").mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- require("cmp").setup.cmdline(':', {
    --   mapping = require("cmp").mapping.preset.cmdline(),
    --   sources = require("cmp").config.sources({
    --     { name = 'path' }
    --   }, {
    --     { name = 'cmdline' }
    --   }),
    --   matching = { disallow_symbol_nonprefix_matching = false }
    -- })
  end,
},

}
