return {
-- the colorscheme should be available when starting Neovim
{
  "Curly-Mo/phlebotinum",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    vim.cmd([[colorscheme phlebotinum]])
    -- color overrides TODO: add these to phlebotinum
    vim.cmd([[
      highlight DiagnosticInfo guifg=#6c6c6c
      highlight CurSearch guibg=#3a3a3a guifg=#c594c5
      highlight IncSearch guibg=#3a3a3a guifg=#c594c5

      " TODO: figure out how to define these overrides outside of phlebotinum
      highlight QuickScopePrimary guifg=#fac863 ctermfg=221 gui=underline cterm=underline
      highlight QuickScopeSecondary guifg=#8fbfdc ctermfg=110 gui=underline cterm=underline
    ]])
  end,
},

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    ---@type false | "classic" | "modern" | "helix"
    preset = "classic",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      -- return ctx.plugin and 0 or 750
      return 1000
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
      -- example to exclude mappings without a description
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    ---@type wk.Spec
    spec = {},
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers manually.
    -- Check the docs for more info.
    ---@type wk.Spec
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
    -- Start hidden and wait for a key to be pressed before showing the popup
    -- Only used by enabled xo mapping modes.
    ---@param ctx { mode: string, operator: string }
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    ---@type wk.Win.opts
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      height = { min = 6, max = 35 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 4, -- spacing between columns
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 3, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    -- Functions/Lua Patterns for formatting the labels
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      -- set to false to disable all mapping icons,
      -- both those explicitly added in a mapping
      -- and those from rules
      mappings = true,
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons from rules
      ---@type wk.IconRule[]|false
      rules = {},
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- disable WhichKey for certain buf types and file types.
    disable = {
      ft = {},
      bt = {},
    },
    debug = false, -- enable wk.log in the current directory
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},

-- tpope
{ "tpope/vim-fugitive", event = "VeryLazy", },
{ "tpope/vim-surround", event = "VeryLazy", },
{ "tpope/vim-obsession", event = "VeryLazy", },
{ "tpope/vim-commentary", event = "VeryLazy", },
{ "tpope/vim-speeddating", event = "VeryLazy", },
{ "tpope/vim-repeat", event = "VeryLazy", },
-- "tpope/vim-unimpaired",
{ "tpope/vim-dadbod", event = "VeryLazy", },
{ "tpope/vim-eunuch", event = "VeryLazy", },
{ "tpope/vim-markdown", event = "VeryLazy", },
-- "tpope/vim-tbone",
{ "tpope/vim-rhubarb", event = "VeryLazy", },
{ "tpope/vim-abolish", event = "VeryLazy", },
{ "tpope/vim-capslock", event = "VeryLazy", },
{ "tpope/vim-vinegar", event = "VeryLazy", },
{ "tpope/vim-projectionist", event = "VeryLazy", },

-- { "vim-airline/vim-airline", event = "VeryLazy", },
-- { "vim-airline/vim-airline-themes", event = "VeryLazy", },
-- "romainl/Apprentice", { "branch": "fancylines-and-neovim" }
-- "romainl/Apprentice", { "branch": "fancylines-and-neovim", "as": "apprentice-airline" }

{
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'stevearc/aerial.nvim',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        'branch',
        {
          'diff',
          -- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed
              }
            end
          end,
        },
      },
      -- lualine_c = {
      --   {
      --     'filename',
      --     file_status = true,      -- Displays file status (readonly status, modified status)
      --     newfile_status = true,   -- Display new file status (new file means no write after created)
      --     path = 3,                -- 0: Just the filename
      --                              -- 1: Relative path
      --                              -- 2: Absolute path
      --                              -- 3: Absolute path, with tilde as the home directory
      --                              -- 4: Filename and parent dir, with tilde as the home directory
      --     shorting_target = 70,    -- Shortens path to leave 40 spaces in the window
      --                              -- for other components. (terrible name, any suggestions?)
      --     symbols = {
      --       modified = '[+]',      -- Text to show when the file is modified.
      --       readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
      --       unnamed = '[No Name]', -- Text to show for unnamed buffers.
      --       newfile = '[New]',     -- Text to show for newly created file before first write
      --     },
      --   },
      -- },
      lualine_x = {
        -- 'encoding',
        {
          "aerial",
          -- The separator to be used to separate symbols in status line.
          -- sep = " ) ",
          -- The number of symbols to render top-down. In order to render only 'N' last
          -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
          -- be used in order to render only current symbol.
          depth = nil,
          -- When 'dense' mode is on, icons are not rendered near their symbols. Only
          -- a single icon that represents the kind of current symbol is rendered at
          -- the beginning of status line.
          dense = true,
          -- The separator to be used to separate symbols in dense mode.
          dense_sep = "⟩",
          -- Color the symbol icons.
          colored = true,
        },
        'fileformat',
        'filetype',
        -- show trailing whitespaces https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#trailing-whitespaces
        function()
          local space = vim.fn.search([[\s\+$]], 'nwc')
          return space ~= 0 and "TW:"..space or ""
        end,
        {
          'diagnostics',
          sources = { 'nvim_diagnostic', 'nvim_lsp' },
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = 'DiagnosticError',
            warn  = 'DiagnosticWarn',
            info  = 'DiagnosticInfo',
            hint  = 'DiagnosticHint',
          },
          symbols = {error = vim.g.icons.error, warn = vim.g.icons.warn, info = vim.g.icons.info, hint = vim.g.icons.hint},
          colored = true,
          update_in_insert = false,
          always_visible = false,
        },
      },
      lualine_y = {'selectioncount', 'searchcount', 'progress'},
      lualine_z = {
        'location',
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  },
  config = function(_, opts)
    local highlight = require('lualine.highlight')
    -- custom filename to set color based on modified status https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#changing-filename-color-based-on--modified-status
    local custom_filename = require('lualine.components.filename'):extend()
    function custom_filename:init(options)
      custom_filename.super.init(self, options)
      self.status_colors = {
        saved = highlight.create_component_highlight_group(
          {fg = require("utils.phlebotinum").status_colors.saved}, 'filename_status_saved', self.options),
        modified = highlight.create_component_highlight_group(
          {fg = require("utils.phlebotinum").status_colors.modified}, 'filename_status_modified', self.options),
      }
      if self.options.color == nil then self.options.color = '' end
    end
    function custom_filename:update_status()
      local data = custom_filename.super.update_status(self)
      data = highlight.component_format_highlight(vim.bo.modified
                                                  and self.status_colors.modified
                                                  or self.status_colors.saved) .. data
      return data
    end
    require('lualine').setup(require("utils").default_opts(opts){
      -- override opts
      options = {
        -- TODO: get custom theme looking good
        -- theme = require("utils.phlebotinum").lualine_theme,
      },
      -- override sections
      sections = {
        lualine_c = {
          {
            custom_filename,
            file_status = true,      -- Displays file status (readonly status, modified status)
            newfile_status = true,   -- Display new file status (new file means no write after created)
            path = 3,                -- 0: Just the filename
                                     -- 1: Relative path
                                     -- 2: Absolute path
                                     -- 3: Absolute path, with tilde as the home directory
                                     -- 4: Filename and parent dir, with tilde as the home directory
            shorting_target = 73,    -- Shortens path to leave 40 spaces in the window
                                     -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified.
              readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]',     -- Text to show for newly created file before first write
            },
          },
        },
      },
    })
  end,
},

-- { "mbbill/undotree", event = "VeryLazy", },
{ "godlygeek/tabular", event = "VeryLazy", },
-- { "luochen1990/rainbow", event = "VeryLazy", },
-- "justinmk/vim-sneak",
{ "wellle/targets.vim" }, -- mostly superceded by nvim-treesitter/nvim-treesitter-textobjects
{
  "bkad/CamelCaseMotion",
  init = function()
    vim.cmd([[
      let g:camelcasemotion_key = '<leader>'
    ]])
  end,
},
-- "derekwyatt/vim-scala", { "for": ["scala"] }
-- "tweekmonster/impsort.vim", { "on": ["ImpSort"] }
-- "lervag/vimtex", { "for": ["tex"] }
{ "NLKNguyen/vim-maven-syntax" },
-- { "mechatroner/rainbow_csv" },
{
  'cameron-wags/rainbow_csv.nvim',
  ft = {
    'csv',
    'tsv',
    'csv_semicolon',
    'csv_whitespace',
    'csv_pipe',
    'rfc_csv',
    'rfc_semicolon'
  },
  cmd = {
    'RainbowDelim',
    'RainbowDelimSimple',
    'RainbowDelimQuoted',
    'RainbowMultiDelim'
  },
  init = function()
    vim.cmd([[
      let g:disable_rainbow_hover = 0
      let g:rainbow_hover_debounce_ms = 500
      let g:disable_rainbow_statusline = 0
      let g:disable_rainbow_key_mappings = 0
      let g:rcsv_colorpairs = [ ['DarkGrey', 'DarkGrey'], ['DarkCyan','DarkCyan'], ['DarkGreen','DarkGreen'], ['LightBlue','LightBlue'], ['DarkMagenta','DarkMagenta'], ['Brown','Brown'] ]
      nnoremap <localleader>csv <CMD>RainbowDelim<CR>
    ]])
  end,
  config = function(_, opts)
    require("rainbow_csv").setup(opts)
  end,
},
{ "raimon49/requirements.txt.vim" },
{
  "ambv/black",
  cmd = {"Black"},
  init = function()
    vim.cmd([[
      let g:black_skip_string_normalization = 1
      let g:black_linelength = 120
    ]])
  end,
},
{
  "embear/vim-localvimrc",
  init = function()
    vim.cmd([[
      let g:localvimrc_whitelist='~/workspace/.*'
    ]])
  end,
},
{
  "unblevable/quick-scope",
  -- keys = { "f", "F", "t", "T" },
  init = function()
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    vim.g.qs_mx_chars = 1000
    vim.g.qs_lazy_highlight = false
    vim.g.qs_delay = 0
    vim.g.qs_accepted_chars = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ',', '.', '(', ')', '{', '}', '[', ']', ';', "'", '"'}
  end,
  config = function()
    -- local quickScopeColorsGroup = vim.api.nvim_create_augroup("quickScopeColors", { clear = false })
    -- vim.api.nvim_create_autocmd("ColorScheme", {
    --   group = quickScopeColorsGroup,
    --   callback = function(args)
    --     vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = '#fac863', bg = 'none', underline = true })
    --     vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = '#8fbfdc', bg = 'none', underline = true })
    --   end,
    -- })
    -- vim.g.qs_hi_priority = 2
    -- vim.cmd([[
    --   augroup qs_colors
    --     autocmd!
    --     autocmd ColorScheme * highlight QuickScopePrimary guifg='#fac863' gui=underline ctermfg=221 cterm=underline
    --     autocmd ColorScheme * highlight QuickScopeSecondary guifg='#8fbfdc' gui=underline ctermfg=110 cterm=underline
    --   augroup END
    -- ]])
  end,
},
{ "alexghergh/nvim-tmux-navigation" },
{
  "andymass/vim-matchup",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    -- vim.g.matchup_matchparen_offscreen = { method = "status" }
    vim.g.matchup_enabled = 1
    vim.g.matchup_matchparen_enabled = 1
    vim.g.matchup_motion_enabled = 1
    vim.g.matchup_text_obj_enabled = 1
    vim.g.matchup_surround_enabled = 1
    vim.g.matchup_transmute_enabled = 1
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_deferred_show_delay = 50
    vim.g.matchup_matchparen_deferred_hide_delay = 700
    vim.g.matchup_matchparen_hi_surround_always = 1
    -- vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#b1d8f6', bg = 'none' })
    -- vim.cmd.highlight("MatchParen guifg=#b1d8f6 ctermfg=012 ctermbg=none")
    -- vim.cmd.highlight("MatchWord guifg=#b1d8f6 ctermfg=012 ctermbg=none")
    -- " hi MatchParen guifg=#b1d8f6 ctermfg=012 ctermbg=none
    -- " hi MatchWord guifg=#b1d8f6 ctermfg=012 ctermbg=none
    vim.cmd([[
      augroup matchup_matchparen_highlight
        autocmd!
        autocmd ColorScheme * hi MatchParen ctermfg=012 guifg=#b1d8f6 ctermbg=none
        autocmd ColorScheme * hi MatchWord ctermfg=012 guifg=#b1d8f6 ctermbg=none
      augroup END
    ]])

    -- TODO: replace with native lua keymapping attempted below
    -- vim.cmd([[ nnoremap "[[" <plug>(matchup-[%) ]])
    vim.keymap.set({'n', 'v'}, '[[', "<Plug>(matchup-[%)", { noremap = false, desc = "matchup.prev" })
    vim.keymap.set({'n', 'v'}, ']]', "<Plug>(matchup-]%)", { noremap = false, desc = "matchup.next" })
  end,
  -- keys = {
  --   {"[[", "<plug>(matchup-[%)", desc = "go to previous match using matchup" },
  --   {"]]", "<plug>(matchup-]%)", desc = "go to next match using matchup" },
  -- },
},
-- "uber/prototool", { "rtp":"vim/prototool" }
{ "mattn/calendar-vim" },
{ "freitass/todo.txt-vim" },
{ "markonm/traces.vim" },
{ "janko/vim-test" },
-- "rcarriga/vim-ultest", { "do": ":UpdateRemotePlugins" }
-- "tweekmonster/startuptime.vim", { "on": ["StartupTime"] }
{ "nanotech/jellybeans.vim" },
-- "sheerun/vim-polyglot",
{ "vim-scripts/ReplaceWithRegister" },
{ "machakann/vim-highlightedyank" },
{ "tommcdo/vim-exchange" },
{
  "nacro90/numb.nvim",
  opts = {
  },
},
-- "petobens/poet-v",
{ "lukhio/vim-mapping-conflicts" },
-- "alok/notational-fzf-vim",
{ "lifepillar/vim-colortemplate" },
{ "stsewd/gx-extended.vim" },
-- {
--   "psliwka/vim-smoothie",
--   init = function()
--     vim.cmd([[
--       let g:smoothie_enabled = 1
--       let g:smoothie_update_interval = 1
--       let g:smoothie_speed_constant_factor = 15
--       let g:smoothie_speed_linear_factor = 40
--       let g:smoothie_speed_exponentiation_factor = 0.999
--       let g:smoothie_no_default_mappings = 0
--       let g:smoothie_experimental_mappings = 1
--       let g:smoothie_break_on_reverse = 0
--     ]])
--   end,
-- },
{
  "airblade/vim-rooter",
  init = function()
    vim.g.rooter_manual_only = 1
  end,
},

-- {
--   "liuchengxu/vista.vim",
--   init = function()
--     vim.cmd([[
--       " let g:vista_icon_indent = ["╰─▸", "├─▸"]
--       " let g:vista_icon_indent = ["▸ ", ", "]
--       " let g:vista_default_executive = 'nvim_lsp'
--       let g:vista_default_executive = 'ctags'
--       let g:vista_finder_alternative_executives = 'ctags'
--       let g:vista#renderer#enable_icon = 1
--       let g:vista_sidebar_width = 25
--       let g:vista_fzf_preview = ['right:0%']
--       let g:vista_keep_fzf_colors = 1
--       let g:vista_echo_cursor_strategy = 'both'
--       let g:vista_blink = [3, 50]
--       let g:vista_cursor_delay = 200
--       let g:vista_floating_delay = 400
--       let g:vista_close_on_jump = 0
--       let g:vista_close_on_fzf_select = 0
--       let g:vista_highlight_whole_line = 1
--       map <M-;> <CMD>Vista!!<CR>
--       map <M-'> <CMD>Vista focus<CR>
--       autocmd FileType vista,vista_kind nnoremap <buffer> <silent>/ :<c-u>call vista#finder#fzf#Run()<CR>
--     ]])
--   end,
-- },

{
  "stevearc/aerial.nvim",
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  opts = {
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    backends = {
      ['_']  = {"lsp", "treesitter"},
      -- python = {"treesitter"},
    },
    layout = {
      -- These control the width of the aerial window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a list of mixed types.
      -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
      max_width = { 26, 0.25 },
      width = nil,
      min_width = 10,
      -- key-value pairs of window-local options for aerial window (e.g. winhl)
      win_opts = {},
      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "prefer_right",
      -- Determines where the aerial window will be opened
      --   edge   - open aerial at the far right/left of the editor
      --   window - open aerial to the right/left of the current window
      placement = "window",
      -- When the symbols change, resize the aerial window (within min/max constraints) to fit
      resize_to_content = true,
      -- Preserve window size equality with (:help CTRL-W_=)
      preserve_equality = false,
    },
    -- Determines how the aerial window decides which buffer to display symbols for
    --   window - aerial window will display symbols for the buffer in the window from which it was opened
    --   global - aerial window will display symbols for the current window
    attach_mode = "window",
    -- List of enum values that configure when to auto-close the aerial window
    --   unfocus       - close aerial when you leave the original source window
    --   switch_buffer - close aerial when you change buffers in the source window
    --   unsupported   - close aerial when attaching to a buffer that has no symbol source
    close_automatic_events = {},
    -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
    -- Additionally, if it is a string that matches "actions.<name>",
    -- it will use the mapping at require("aerial.actions").<name>
    -- Set to `false` to remove a keymap
    keymaps = {
      ["?"] = "actions.show_help",
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["p"] = "actions.scroll",
      ["<C-j>"] = "actions.down_and_scroll",
      ["<C-k>"] = "actions.up_and_scroll",
      ["{"] = "actions.prev",
      ["}"] = "actions.next",
      ["[["] = "actions.prev_up",
      ["]]"] = "actions.next_up",
      ["q"] = "actions.close",
      ["o"] = "actions.tree_toggle",
      ["za"] = "actions.tree_toggle",
      ["O"] = "actions.tree_toggle_recursive",
      ["zA"] = "actions.tree_toggle_recursive",
      ["l"] = "actions.tree_open",
      ["zo"] = "actions.tree_open",
      ["L"] = "actions.tree_open_recursive",
      ["zO"] = "actions.tree_open_recursive",
      ["h"] = "actions.tree_close",
      ["zc"] = "actions.tree_close",
      ["H"] = "actions.tree_close_recursive",
      ["zC"] = "actions.tree_close_recursive",
      ["zr"] = "actions.tree_increase_fold_level",
      ["zR"] = "actions.tree_open_all",
      ["zm"] = "actions.tree_decrease_fold_level",
      ["zM"] = "actions.tree_close_all",
      ["zx"] = "actions.tree_sync_folds",
      ["zX"] = "actions.tree_sync_folds",
      ["/"] = "<CMD>call aerial#fzf()<CR>",
    },
    -- When true, don't load aerial until a command or function is called
    -- Defaults to true, unless `on_attach` is provided, then it defaults to false
    lazy_load = true,
    -- Disable aerial on files with this many lines
    disable_max_lines = 10000,
    -- Disable aerial on files this size or larger (in bytes)
    disable_max_size = 2000000, -- Default 2MB
    -- A list of all symbols to display. Set to false to display all symbols.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- To see all available values, see :help SymbolKind
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",
    },
    -- Determines line highlighting mode when multiple splits are visible.
    -- split_width   Each open window will have its cursor location marked in the
    --               aerial buffer. Each line will only be partially highlighted
    --               to indicate which window is at that location.
    -- full_width    Each open window will have its cursor location marked as a
    --               full-width highlight in the aerial buffer.
    -- last          Only the most-recently focused window will have its location
    --               marked in the aerial buffer.
    -- none          Do not show the cursor locations in the aerial window.
    highlight_mode = "split_width",
    -- Highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,
    -- Highlight the symbol in the source buffer when cursor is in the aerial win
    highlight_on_hover = false,
    -- When jumping to a symbol, highlight the line for this many ms.
    -- Set to false to disable
    highlight_on_jump = 300,
    -- Jump to symbol in source window when the cursor moves
    autojump = false,
    -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
    -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
    -- default collapsed icon. The default icon set is determined by the
    -- "nerd_font" option below.
    -- If you have lspkind-nvim installed, it will be the default icon set.
    -- This can be a filetype map (see :help aerial-filetype-map)
    icons = {},
    -- Control which windows and buffers aerial should ignore.
    -- Aerial will not open when these are focused, and existing aerial windows will not be updated
    ignore = {
      -- Ignore unlisted buffers. See :help buflisted
      unlisted_buffers = false,
      -- Ignore diff windows (setting to false will allow aerial in diff windows)
      diff_windows = true,
      -- List of filetypes to ignore.
      filetypes = {},
      -- Ignored buftypes.
      -- Can be one of the following:
      -- false or nil - No buftypes are ignored.
      -- "special"    - All buffers other than normal, help and man page buffers are ignored.
      -- table        - A list of buftypes to ignore. See :help buftype for the
      --                possible values.
      -- function     - A function that returns true if the buffer should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `bufnr` and `buftype`.
      buftypes = "special",
      -- Ignored wintypes.
      -- Can be one of the following:
      -- false or nil - No wintypes are ignored.
      -- "special"    - All windows other than normal windows are ignored.
      -- table        - A list of wintypes to ignore. See :help win_gettype() for the
      --                possible values.
      -- function     - A function that returns true if the window should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `winid` and `wintype`.
      wintypes = "special",
    },
    -- Use symbol tree for folding. Set to true or false to enable/disable
    -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
    -- This can be a filetype map (see :help aerial-filetype-map)
    manage_folds = false,
    -- When you fold code with za, zo, or zc, update the aerial tree as well.
    -- Only works when manage_folds = true
    link_folds_to_tree = false,
    -- Fold code when you open/collapse symbols in the tree.
    -- Only works when manage_folds = true
    link_tree_to_folds = true,
    -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
    -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
    nerd_font = "auto",
    -- Call this function when aerial attaches to a buffer.
    -- on_attach = function(bufnr) end,
    -- Call this function when aerial first sets symbols on a buffer.
    -- on_first_symbols = function(bufnr) end,
    -- Automatically open aerial when entering supported buffers.
    -- This can be a function (see :help aerial-open-automatic)
    open_automatic = false,
    -- Run this command after jumping to a symbol (false will disable)
    -- post_jump_cmd = "normal! zz",
    -- Invoked after each symbol is parsed, can be used to modify the parsed item,
    -- or to filter it by returning false.
    -- bufnr: a neovim buffer number
    -- item: of type aerial.Symbol
    -- ctx: a record containing the following fields:
    --   * backend_name: treesitter, lsp, man...
    --   * lang: info about the language
    --   * symbols?: specific to the lsp backend
    --   * symbol?: specific to the lsp backend
    --   * syntax_tree?: specific to the treesitter backend
    --   * match?: specific to the treesitter backend, TS query match
    -- post_parse_symbol = function(bufnr, item, ctx)
    --   return true
    -- end,
    -- Invoked after all symbols have been parsed and post-processed,
    -- allows to modify the symbol structure before final display
    -- bufnr: a neovim buffer number
    -- items: a collection of aerial.Symbol items, organized in a tree,
    --        with 'parent' and 'children' fields
    -- ctx: a record containing the following fields:
    --   * backend_name: treesitter, lsp, man...
    --   * lang: info about the language
    --   * symbols?: specific to the lsp backend
    --   * syntax_tree?: specific to the treesitter backend
    -- post_add_all_symbols = function(bufnr, items, ctx)
    --   return items
    -- end,
    -- When true, aerial will automatically close after jumping to a symbol
    close_on_select = false,
    -- The autocmds that trigger symbols update (not used for LSP backend)
    update_events = "TextChanged,InsertLeave",
    -- Show box drawing characters for the tree hierarchy
    show_guides = true,
    -- Customize the characters used when show_guides = true
    guides = {
      -- When the child item has a sibling below it
      mid_item = "├─",
      -- When the child item is the last in the list
      last_item = "└─",
      -- When there are nested child guides to the right
      nested_top = "│ ",
      -- Raw indentation
      whitespace = "  ",
    },
    -- Set this function to override the highlight groups for certain symbols
    -- get_highlight = function(symbol, is_icon, is_collapsed)
    --   -- return "MyHighlight" .. symbol.kind
    -- end,
    -- Options for opening aerial in a floating win
    float = {
      -- Controls border appearance. Passed to nvim_open_win
      -- border = "rounded",
      -- Determines location of floating window
      --   cursor - Opens float on top of the cursor
      --   editor - Opens float centered in the editor
      --   win    - Opens float centered in the window
      relative = "cursor",
      -- These control the height of the floating window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_height and max_height can be a list of mixed types.
      -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
      max_height = 0.9,
      height = nil,
      min_height = { 8, 0.1 },
      -- override = function(conf, source_winid)
      --   -- This is the config that will be passed to nvim_open_win.
      --   -- Change values here to customize the layout
      --   return conf
      -- end,
    },
    -- Options for the floating nav windows
    nav = {
      -- border = "rounded",
      max_height = 0.9,
      min_height = { 10, 0.1 },
      max_width = 0.5,
      min_width = { 0.2, 20 },
      win_opts = {
        cursorline = true,
        winblend = 10,
      },
      -- Jump to symbol in source window when the cursor moves
      autojump = false,
      -- Show a preview of the code in the right column, when there are no child symbols
      preview = false,
      -- Keymaps in the nav window
      keymaps = {
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["h"] = "actions.left",
        ["l"] = "actions.right",
        ["<C-c>"] = "actions.close",
      },
    },
    lsp = {
      -- If true, fetch document symbols when LSP diagnostics update.
      diagnostics_trigger_update = false,
      -- Set to false to not update the symbols when there are LSP errors
      update_when_errors = true,
      -- How long to wait (in ms) after a buffer change before updating
      -- Only used when diagnostics_trigger_update = false
      update_delay = 5000,
      -- Map of LSP client name to priority. Default value is 10.
      -- Clients with higher (larger) priority will be used before those with lower priority.
      -- Set to -1 to never use the client.
      priority = {
        -- pyright = 10,
      },
    },
    treesitter = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 1000,
    },
    markdown = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 1000,
    },
    asciidoc = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 1000,
    },
    man = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 1000,
    },
  },
  config = function(_, opts)
    require('aerial').setup(require("utils").default_opts(opts){})
  end,
  keys = {
    {'<M-;>', "<cmd>AerialToggle<CR>"},
    {'<M-t>', function() require("telescope").extensions.aerial.aerial() end},
  },
},

{ "lambdalisue/vim-suda" },

{
  "dstein64/vim-startuptime",
  cmd = "StartupTime",
  init = function()
    vim.g.startuptime_tries = 10
  end,
},

{
  "nvim-tree/nvim-web-devicons",
  opts = {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    -- override = {
    --  zsh = {
    --    icon = "",
    --    color = "#428850",
    --    cterm_color = "65",
    --    name = "Zsh"
    --  },
    -- },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    -- strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    -- override_by_filename = {
    --  [".gitignore"] = {
    --    icon = "",
    --    color = "#f1502f",
    --    name = "Gitignore"
    --  }
    -- },
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    -- override_by_extension = {
    --  ["log"] = {
    --    icon = "",
    --    color = "#81e043",
    --    name = "Log"
    --  }
    -- },
    -- same as `override` but specifically for operating system
    -- takes effect when `strict` is true
    -- override_by_operating_system = {
    --  ["apple"] = {
    --    icon = "",
    --    color = "#A2AAAD",
    --    cterm_color = "248",
    --    name = "Apple",
    --  },
    -- },
  },
},

{
  "echasnovski/mini.nvim",
  -- opts = {
  --   -- Icon style: 'glyph' or 'ascii'
  --   style = 'glyph',
  --   -- Customize per category. See `:h MiniIcons.config` for details.
  --   default   = {},
  --   directory = {},
  --   extension = {},
  --   file      = {},
  --   filetype  = {},
  --   lsp       = {},
  --   os        = {},
  --   -- Control which extensions will be considered during "file" resolution
  --   use_file_extension = function(ext, file) return true end,
  -- },
},

{
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  opts = {
    -- type of hints you want to get
    -- following types are supported
    -- 'statusline-winbar' | 'floating-big-letter'
    -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
    -- 'floating-big-letter' draw big letter on a floating window
    -- used
    hint = 'statusline-winbar',
    -- when you go to window selection mode, status bar will show one of
    -- following letters on them so you can use that letter to select the window
    selection_chars = 'FJDKSLA;CMRUEIWOQP',
    -- This section contains picker specific configurations
    picker_config = {
      statusline_winbar_picker = {
        -- You can change the display string in status bar.
        -- It supports '%' printf style. Such as `return char .. ': %f'` to display
        -- buffer file path. See :h 'stl' for details.
        selection_display = function(char, windowid)
          return '%=' .. char .. '%='
        end,
        -- whether you want to use winbar instead of the statusline
        -- "always" means to always use winbar,
        -- "never" means to never use winbar
        -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
        use_winbar = 'never', -- "always" | "never" | "smart"
      },
      floating_big_letter = {
        -- window picker plugin provides bunch of big letter fonts
        -- fonts will be lazy loaded as they are being requested
        -- additionally, user can pass in a table of fonts in to font
        -- property to use instead
        font = 'ansi-shadow', -- ansi-shadow |
      },
    },
    -- whether to show 'Pick window:' prompt
    show_prompt = true,
    -- prompt message to show to get the user input
    prompt_message = 'Pick window: ',
    -- if you want to manually filter out the windows, pass in a function that
    -- takes two parameters. You should return window ids that should be
    -- included in the selection
    -- EX:-
    -- function(window_ids, filters)
    --    -- folder the window_ids
    --    -- return only the ones you want to include
    --    return {1000, 1001}
    -- end
    filter_func = nil,
    -- following filters are only applied when you are using the default filter
    -- defined by this plugin. If you pass in a function to "filter_func"
    -- property, you are on your own
    filter_rules = {
      -- when there is only one window available to pick from, use that window
      -- without prompting the user to select
      autoselect_one = true,
      -- whether you want to include the window you are currently on to window
      -- selection or not
      include_current_win = false,
      -- filter using buffer options
      bo = {
        -- if the file type is one of following, the window will be ignored
        filetype = { 'NvimTree', 'neo-tree', 'neo-tree-popup', 'notify' },
        -- if the file type is one of following, the window will be ignored
        buftype = { 'terminal', 'quickfix' },
      },
      -- filter using window options
      wo = {},
      -- if the file path contains one of following names, the window
      -- will be ignored
      file_path_contains = {},
      -- if the file name contains one of following names, the window will be
      -- ignored
      file_name_contains = {},
    },
    -- You can pass in the highlight name or a table of content to set as
    -- highlight
    highlights = {
      statusline = {
        focused = {
          fg = '#ededed',
          bg = '#e35e4f',
          bold = true,
        },
        unfocused = {
          fg = '#ededed',
          bg = '#44cc41',
          bold = true,
        },
      },
      winbar = {
        focused = {
          fg = '#ededed',
          bg = '#e35e4f',
          bold = true,
        },
        unfocused = {
          fg = '#ededed',
          bg = '#44cc41',
          bold = true,
        },
      },
    },
  },
},

{
  "nvim-neo-tree/neo-tree.nvim",
  -- branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    's1n7ax/nvim-window-picker',
  },
  config = function(_, opts)
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
      {text = "󰌵", texthl = "DiagnosticSignHint"})
    require("neo-tree").setup({
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
      sort_case_insensitive = false, -- used when sorting files and directories in the tree
      sort_function = nil , -- use a custom function for sorting files and directories in the tree
      -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- this sorts files and directories descendantly
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 1,
          padding = 0, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon"
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = false,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖",-- this can only be used in the git_status source
            renamed   = "󰁕",-- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
          enabled = true,
          required_width = 64, -- min width of window required to show this column
        },
        type = {
          enabled = true,
          required_width = 122, -- min width of window required to show this column
        },
        last_modified = {
          enabled = true,
          required_width = 88, -- min width of window required to show this column
        },
        created = {
          enabled = true,
          required_width = 110, -- min width of window required to show this column
        },
        symlink_target = {
          enabled = false,
        },
      },
      -- A list of functions, each representing a global custom command
      -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
      -- see `:h neo-tree-custom-commands-global`
      commands = {},
      event_handlers = {
        -- auto close when file is opened
        {
          event = "file_opened",
          handler = function(_)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel", -- close preview or floating neo-tree window
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          -- Read `# Preview Mode` for more information
          ["l"] = "focus_preview",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          -- ["S"] = "split_with_window_picker",
          -- ["s"] = "vsplit_with_window_picker",
          ["t"] = "open_tabnew",
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          ["w"] = "open_with_window_picker",
          --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
          ["C"] = "close_node",
          -- ['C'] = 'close_all_subnodes',
          ["z"] = "close_all_nodes",
          --["Z"] = "expand_all_nodes",
          ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none" -- "none", "relative", "absolute"
            }
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
          -- ["c"] = {
          --  "copy",
          --  config = {
          --    show_path = "none" -- "none", "relative", "absolute"
          --  }
          --}
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        }
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            --"node_modules"
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          always_show_by_pattern = { -- uses glob style patterns
            --".env*",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                -- in whatever position is specified in window.position
                              -- "open_current",  -- netrw disabled, opening a directory opens within the
                                                -- window like netrw would, regardless of window.position
                              -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                        -- instead of relying on nvim autocmd events.
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
            ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["og"] = { "order_by_git_status", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
            -- ['<key>'] = function(state) ... end,
          },
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
            -- ['<key>'] = function(state, scroll_padding) ... end,
          },
        },
        commands = {} -- Add a custom command or override a global one using the same function name
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          }
        },
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"]  = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          }
        }
      }
    })
    vim.cmd([[nnoremap <m-\> <CMD>Neotree toggle<cr>]])
    vim.cmd([[nnoremap <leader><leader> <CMD>Neotree toggle<cr>]])
  end
},

{
  "j-hui/fidget.nvim",
  opts = {
    -- Options related to LSP progress subsystem
    progress = {
      poll_rate = 0,                -- How and when to poll for progress messages
      suppress_on_insert = false,   -- Suppress new messages while in insert mode
      ignore_done_already = false,  -- Ignore new tasks that are already complete
      ignore_empty_message = false, -- Ignore new tasks that don't contain a message
      clear_on_detach =             -- Clear notification group when LSP server detaches
        function(client_id)
          local client = vim.lsp.get_client_by_id(client_id)
          return client and client.name or nil
        end,
      notification_group =          -- How to get a progress message's notification group key
        function(msg) return msg.lsp_client.name end,
      ignore = {},                  -- List of LSP servers to ignore
      -- Options related to how LSP progress messages are displayed as notifications
      display = {
        render_limit = 16,          -- How many LSP messages to show at once
        done_ttl = 3,               -- How long a message should persist after completion
        done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
        done_style = "Constant",    -- Highlight group for completed LSP tasks
        progress_ttl = math.huge,   -- How long a message should persist when in progress
        progress_icon =             -- Icon shown when LSP progress tasks are in progress
          { pattern = "dots", period = 1 },
        progress_style =            -- Highlight group for in-progress LSP tasks
          "WarningMsg",
        group_style = "Title",      -- Highlight group for group name (LSP server name)
        icon_style = "Question",    -- Highlight group for group icons
        priority = 30,              -- Ordering priority for LSP notification group
        skip_history = true,        -- Whether progress notifications should be omitted from history
        -- format_message =            -- How to format a progress message
        --   require("fidget.progress.display").default_format_message,
        format_annote =             -- How to format a progress annotation
          function(msg) return msg.title end,
        format_group_name =         -- How to format a progress notification group's name
          function(group) return tostring(group) end,
        overrides = {               -- Override options from the default notification config
          rust_analyzer = { name = "rust-analyzer" },
        },
      },
      -- Options related to Neovim's built-in LSP client
      lsp = {
        progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
        log_handler = false,        -- Log `$/progress` handler invocations (for debugging)
      },
    },
    -- Options related to notification subsystem
    notification = {
      poll_rate = 10,               -- How frequently to update and render notifications
      filter = vim.log.levels.INFO, -- Minimum notifications level
      history_size = 128,           -- Number of removed messages to retain in history
      override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
      -- configs =                     -- How to configure notification groups when instantiated
      --   { default = require("fidget.notification").default_config },
      redirect =                    -- Conditionally redirect notifications to another backend
        function(msg, level, opts)
          if opts and opts.on_open then
            return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
          end
        end,
      -- Options related to how notifications are rendered as text
      view = {
        stack_upwards = true,       -- Display notification items from bottom to top
        icon_separator = " ",       -- Separator between group name and icon
        group_separator = "---",    -- Separator between notification groups
        group_separator_hl =        -- Highlight group used for group separator
          "Comment",
        render_message =            -- How to render notification messages
          function(msg, cnt)
            return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
          end,
      },
      -- Options related to the notification window and buffer
      window = {
        normal_hl = "Comment",      -- Base highlight group in the notification window
        winblend = 100,             -- Background color opacity in the notification window
        border = "none",            -- Border around the notification window
        zindex = 45,                -- Stacking priority of the notification window
        max_width = 0,              -- Maximum width of the notification window
        max_height = 0,             -- Maximum height of the notification window
        x_padding = 1,              -- Padding from right edge of window boundary
        y_padding = 0,              -- Padding from bottom edge of window boundary
        align = "bottom",           -- How to align the notification window
        relative = "editor",        -- What the notification window position is relative to
      },
    },
    -- Options related to integrating with other plugins
    integration = {
      ["nvim-tree"] = {
        enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
      },
      ["xcodebuild-nvim"] = {
        enable = true,              -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
      },
    },
    -- Options related to logging
    logger = {
      level = vim.log.levels.WARN,  -- Minimum logging level
      max_size = 10000,             -- Maximum log file size, in KB
      float_precision = 0.01,       -- Limit the number of decimals displayed for floats
      path =                        -- Where Fidget writes its logs to
        string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
    },
  },
},

{
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      left = "",
      right = "",
      diag = "●",
      arrow = "   ",
      up_arrow = "   ",
      vertical = " │",
      vertical_end = " └",
    },
    hi = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
      arrow = "NonText",
      background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
      mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
    },
    blend = {
      factor = 0.17,
    },
    options = {
      -- Show the source of the diagnostic.
      show_source = false,
      -- Throttle the update of the diagnostic when moving cursor, in milliseconds.
      -- You can increase it if you have performance issues.
      -- Or set it to 0 to have better visuals.
      throttle = 200,
      -- The minimum length of the message, otherwise it will be on a new line.
      softwrap = 35,
      -- If multiple diagnostics are under the cursor, display all of them.
      multiple_diag_under_cursor = false,
      -- Enable diagnostic message on all lines.
      multilines = true,
      overflow = {
        -- Manage the overflow of the message.
        --    - wrap: when the message is too long, it is then displayed on multiple lines.
        --    - none: the message will not be truncated.
        --    - oneline: message will be displayed entirely on one line.
        mode = "wrap",
      },
      -- Format the diagnostic message.
      -- Example:
      -- format = function(diagnostic)
      --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
      -- end,
      format = nil,
      --- Enable it if you want to always have message with `after` characters length.
      break_line = {
        enabled = false,
        after = 40,
      },
      virt_texts = {
        priority = 2048,
      },
      -- Filter by severity.
      severity = {
        vim.diagnostic.severity.ERROR,
        -- vim.diagnostic.severity.WARN,
        -- vim.diagnostic.severity.INFO,
        -- vim.diagnostic.severity.HINT,
      },
      -- Overwrite events to attach to a buffer. You should not change it, but if the plugin
      -- does not works in your configuration, you may try to tweak it.
      overwrite_events = nil,
    },
  },
},

---- could be replaced with nvim-treesitter/nvim-treesitter-textobjects make_repeatable_move_pair instead
--{ -- repeat any movements with ; and ,
--  "ghostbuster91/nvim-next",
--  dependencies = {
--    "lewis6991/gitsigns.nvim",
--  },
--  opts = {
--    default_mappings = {
--      repeat_style = "original",
--    },
--  },
--  config = function(_, opts)
--    local next =require("nvim-next").setup(require("utils").concat(opts, {
--      items = {
--        require("nvim-next.builtins").f,
--        require("nvim-next.builtins").t,
--      },
--    })
--    local functions = require("nvim-next.builtins.functions")
--    local next_integrations = require("nvim-next.integrations")
--    local gitsigns_on_attach = require("gitsigns.config").config.on_attach
--    require("gitsigns").setup({
--      on_attach = function(bufnr)
--        gitsigns_on_attach()
--        -- override some keymaps with next wrapper
--        local gs = package.loaded.gitsigns
--        local nngs = next_integrations.gitsigns(gs)
--        local opt = { buffer = bufnr }
--        opt = {}
--        vim.keymap.set('n', ']h', function()
--          if vim.wo.diff then
--            return ']h'
--          else
--            vim.schedule(function() nngs.next_hunk() end)
--            return '<Ignore>'
--          end
--        end, { unpack(opt), expr = true })
--        vim.keymap.set('n', '[h', function()
--          if vim.wo.diff then
--            return ']h'
--          else
--            vim.schedule(function() nngs.prev_hunk() end)
--            return '<Ignore>'
--          end
--        end, { unpack(opt), expr = true })
--      end,
--    })
--    local nndiag = next_integrations.diagnostic()
--    vim.keymap.set('n', '[d', nndiag.goto_prev({ severity = {min = vim.diagnostic.severity.ERROR} }), { desc = "previous error" })
--    vim.keymap.set('n', ']d', nndiag.goto_next({ severity = {min = vim.diagnostic.severity.ERROR} }), { desc = "next error" })
--    vim.keymap.set('n', '[D', nndiag.goto_prev({ severity = {min = vim.diagnostic.severity.HINT} }), { desc = "previous diagnostic" })
--    vim.keymap.set('n', ']D', nndiag.goto_next({ severity = {min = vim.diagnostic.severity.HINT} }), { desc = "next diagnostic" })
--    vim.keymap.set('n', '[c', nndiag.goto_prev({ severity = {min = vim.diagnostic.severity.WARN} }), { desc = "previous warning" })
--    vim.keymap.set('n', ']c', nndiag.goto_next({ severity = {min = vim.diagnostic.severity.WARN} }), { desc = "next warning" })
--    next_integrations.treesitter_textobjects()
--    require("nvim-treesitter.configs").setup({
--      nvim_next = {
--        enable = true,
--        textobjects = {
--          --instead of defining the move section in the textobjects scope we move it under nvim_next
--          move = {
--            goto_next_start = {
--              ["]f"] = "@function.outer",
--              ["]e"] = "@block.outer",
--              -- ["]s"] = "@statement.outer",
--              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
--            },
--            goto_next_end = {
--              ["]F"] = "@function.outer",
--              ["]E"] = "@block.outer",
--              -- ["]S"] = "@statement.outer",
--              ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
--            },
--            goto_previous_start = {
--              ["[f"] = "@function.outer",
--              ["[e"] = "@block.outer",
--              -- ["[s"] = "@statement.outer",
--              ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
--            },
--            goto_previous_end = {
--              ["[F"] = "@function.outer",
--              ["[E"] = "@block.outer",
--              -- ["[S"] = "@statement.outer",
--              ["[S"] = { query = "@scope", query_group = "locals", desc = "Previous scope end" },
--            },
--          },
--        },
--      },
--    })
--  end,
--},

{
  "brenoprata10/nvim-highlight-colors",
  opts = {
    enable_named_colors = true,
    enable_tailwind = false,
  },
  config = function(_, opts)
    require('nvim-highlight-colors').setup(opts)
  end,
},

{
  "matze/vim-move",
  init = function()
    vim.cmd([[
      let g:move_key_modifier = 'C'
      let g:move_key_modifier_visualmode = 'C'
    ]])
  end,
},

{
  "inside/vim-search-pulse",
  init = function()
    vim.cmd([[
      let g:vim_search_pulse_mode = 'pattern'
      let g:vim_search_pulse_duration = 200
      let g:vim_search_pulse_color_list = ['#3a3a3a', '#444444', '#4e4e4e', '#585858', '#606060']
    ]])
  end,
},

}
