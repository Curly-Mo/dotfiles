return {
-- the colorscheme should be available when starting Neovim
{
  "Curly-Mo/phlebotinum",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[colorscheme phlebotinum]])
  end,
},

{ "folke/neodev.nvim", event = "VeryLazy", },

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
      return 750
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
      { "<auto>", mode = "nxso" },
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
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
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
    expand = 0, -- expand groups when <= n mappings
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

{ "folke/neoconf.nvim", cmd = "Neoconf", event = "VeryLazy", },

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

{ "vim-airline/vim-airline", event = "VeryLazy", },
{ "vim-airline/vim-airline-themes", event = "VeryLazy", },
-- "romainl/Apprentice", { "branch": "fancylines-and-neovim" }
-- "romainl/Apprentice", { "branch": "fancylines-and-neovim", "as": "apprentice-airline" }
{ "mbbill/undotree", event = "VeryLazy", },
{ "godlygeek/tabular", event = "VeryLazy", },
{ "haya14busa/incsearch.vim", event = "VeryLazy", },
{ "luochen1990/rainbow", event = "VeryLazy", },
-- "justinmk/vim-sneak",
{ "AndrewRadev/splitjoin.vim", event = "VeryLazy", },
-- {
--   "Wansmer/treesj",
--   keys = {
--     { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
--   },
--   dependencies = { "nvim-treesitter/nvim-treesitter" },
--   opts = {
--     use_default_keymaps = false,
--     max_join_length = 150,
--   },
--   config = function()
--     local treesj = require('treesj')
--     local langs = require('treesj.langs')['presets']
--     treesj.setup({
--       ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
--       use_default_keymaps = false,
--       ---@type boolean Node with syntax error will not be formatted
--       check_syntax_error = true,
--       ---If line after join will be longer than max value,
--       ---@type number If line after join will be longer than max value, node will not be formatted
--       max_join_length = 120,
--       ---Cursor behavior:
--       ---hold - cursor follows the node/place on which it was called
--       ---start - cursor jumps to the first symbol of the node being formatted
--       ---end - cursor jumps to the last symbol of the node being formatted
--       ---@type 'hold'|'start'|'end'
--       cursor_behavior = 'hold',
--       ---@type boolean Notify about possible problems or not
--       notify = true,
--       ---@type boolean Use `dot` for repeat action
--       dot_repeat = true,
--       ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
--       on_error = nil,
--       ---@type table Presets for languages
--       -- langs = {}, -- See the default presets in lua/treesj/langs
--     })
--     -- configure fallback for unsupported lans https://github.com/Wansmer/treesj/discussions/19
--     vim.api.nvim_create_autocmd({ 'FileType' }, {
--       pattern = '*',
--       callback = function()
--         local opts = { buffer = true }
--         if langs[vim.bo.filetype] then
--           vim.keymap.set('n', 'J', '<Cmd>TSJToggle<CR>', opts)
--         else
--           vim.keymap.set('n', 'J', '<Cmd>SplitjoinJoin<CR>', opts)
--           vim.keymap.set('n', '<c-j>', '<Cmd>SplitjoinSplit<CR>', opts)
--         end
--       end,
--     })
--   end,
-- },
{ "wellle/targets.vim" },
{ "bkad/CamelCaseMotion" },
-- "derekwyatt/vim-scala", { "for": ["scala"] }
-- "tweekmonster/impsort.vim", { "on": ["ImpSort"] }
-- "lervag/vimtex", { "for": ["tex"] }
{ "NLKNguyen/vim-maven-syntax" },
-- "mechatroner/rainbow_csv",
{ "raimon49/requirements.txt.vim" },
-- "ambv/black", { "on": ["Black"] }
{ "embear/vim-localvimrc" },
{
  "unblevable/quick-scope",
  -- keys = { "f", "F", "t", "T" },
  init = function()
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    vim.g.qs_mx_chars = 200
    -- local quickScopeColorsGroup = vim.api.nvim_create_augroup("quickScopeColors", { clear = true })
    -- vim.highlight.create('QuickScopeSecondary', {guifg="#8fbfdc", ctermfg=110, gui="underline", cterm="underline",},
    -- vim.api.nvim_create_autocmd("ColorScheme", {
    --   command = "highlight QuickScopePrimary guifg=#fac863 ctermfg=221 gui=underline cterm=underline",
    --   group = quickScopeColorsGroup,
    -- }),
    -- vim.api.nvim_create_autocmd("ColorScheme", {
    --   command = "highlight QuickScopeSecondary guifg=#fac863 ctermfg=221 gui=underline cterm=underline",
    --   group = quickScopeColorsGroup,
    -- }),
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
    vim.keymap.set('n', '[[', "<Plug>(matchup-[%)", { noremap = false })
    vim.keymap.set('n', ']]', "<Plug>(matchup-]%)", { noremap = false })
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
{ "michaeljsmith/vim-indent-object" },
{ "lifepillar/vim-colortemplate" },
{ "stsewd/gx-extended.vim" },
-- "psliwka/vim-smoothie",
{ "airblade/vim-rooter" },
{ "liuchengxu/vista.vim" },
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
  "nvim-neo-tree/neo-tree.nvim",
  -- branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
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
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
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
          use_git_status_colors = true,
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
            untracked = "",
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
      window = {
        position = "left",
        width = 24,
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
          enabled = false, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = false, -- when true, empty folders will be grouped together
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

    vim.cmd([[nnoremap <m-\> :Neotree toggle<cr>]])
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
}

}
