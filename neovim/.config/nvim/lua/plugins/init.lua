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
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
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
    vim.g.matchup_matchparen_deferred = 1
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
  end,
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
{ "ryanoasis/vim-devicons" },
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
{ "nvim-tree/nvim-web-devicons", lazy = true },
-- {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
--   },
--   config = function ()
--     -- If you want icons for diagnostic errors, you'll need to define them somewhere:
--     vim.fn.sign_define("DiagnosticSignError",
--       {text = " ", texthl = "DiagnosticSignError"})
--     vim.fn.sign_define("DiagnosticSignWarn",
--       {text = " ", texthl = "DiagnosticSignWarn"})
--     vim.fn.sign_define("DiagnosticSignInfo",
--       {text = " ", texthl = "DiagnosticSignInfo"})
--     vim.fn.sign_define("DiagnosticSignHint",
--       {text = "󰌵", texthl = "DiagnosticSignHint"})
--
--     require("neo-tree").setup({
--       close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
--       popup_border_style = "rounded",
--       enable_git_status = true,
--       enable_diagnostics = true,
--       open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
--       sort_case_insensitive = false, -- used when sorting files and directories in the tree
--       sort_function = nil , -- use a custom function for sorting files and directories in the tree 
--       -- sort_function = function (a,b)
--       --       if a.type == b.type then
--       --           return a.path > b.path
--       --       else
--       --           return a.type > b.type
--       --       end
--       --   end , -- this sorts files and directories descendantly
--       default_component_configs = {
--         container = {
--           enable_character_fade = true
--         },
--         indent = {
--           indent_size = 1,
--           padding = 0, -- extra padding on left hand side
--           -- indent guides
--           with_markers = true,
--           indent_marker = "│",
--           last_indent_marker = "└",
--           highlight = "NeoTreeIndentMarker",
--           -- expander config, needed for nesting files
--           with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
--           expander_collapsed = "",
--           expander_expanded = "",
--           expander_highlight = "NeoTreeExpander",
--         },
--         icon = {
--           folder_closed = "",
--           folder_open = "",
--           folder_empty = "󰜌",
--           -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
--           -- then these will never be used.
--           default = "*",
--           highlight = "NeoTreeFileIcon"
--         },
--         modified = {
--           symbol = "[+]",
--           highlight = "NeoTreeModified",
--         },
--         name = {
--           trailing_slash = false,
--           use_git_status_colors = true,
--           highlight = "NeoTreeFileName",
--         },
--         git_status = {
--           symbols = {
--             -- Change type
--             added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
--             modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
--             deleted   = "✖",-- this can only be used in the git_status source
--             renamed   = "󰁕",-- this can only be used in the git_status source
--             -- Status type
--             untracked = "",
--             ignored   = "",
--             unstaged  = "󰄱",
--             staged    = "",
--             conflict  = "",
--           }
--         },
--         -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
--         file_size = {
--           enabled = true,
--           required_width = 64, -- min width of window required to show this column
--         },
--         type = {
--           enabled = true,
--           required_width = 122, -- min width of window required to show this column
--         },
--         last_modified = {
--           enabled = true,
--           required_width = 88, -- min width of window required to show this column
--         },
--         created = {
--           enabled = true,
--           required_width = 110, -- min width of window required to show this column
--         },
--         symlink_target = {
--           enabled = false,
--         },
--       },
--       -- A list of functions, each representing a global custom command
--       -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
--       -- see `:h neo-tree-custom-commands-global`
--       commands = {},
--       window = {
--         position = "left",
--         width = 24,
--         mapping_options = {
--           noremap = true,
--           nowait = true,
--         },
--         mappings = {
--           ["<space>"] = {
--               "toggle_node",
--               nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
--           },
--           ["<2-LeftMouse>"] = "open",
--           ["<cr>"] = "open",
--           ["<esc>"] = "cancel", -- close preview or floating neo-tree window
--           ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
--           -- Read `# Preview Mode` for more information
--           ["l"] = "focus_preview",
--           ["S"] = "open_split",
--           ["s"] = "open_vsplit",
--           -- ["S"] = "split_with_window_picker",
--           -- ["s"] = "vsplit_with_window_picker",
--           ["t"] = "open_tabnew",
--           -- ["<cr>"] = "open_drop",
--           -- ["t"] = "open_tab_drop",
--           ["w"] = "open_with_window_picker",
--           --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
--           ["C"] = "close_node",
--           -- ['C'] = 'close_all_subnodes',
--           ["z"] = "close_all_nodes",
--           --["Z"] = "expand_all_nodes",
--           ["a"] = {
--             "add",
--             -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
--             -- some commands may take optional config options, see `:h neo-tree-mappings` for details
--             config = {
--               show_path = "none" -- "none", "relative", "absolute"
--             }
--           },
--           ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
--           ["d"] = "delete",
--           ["r"] = "rename",
--           ["y"] = "copy_to_clipboard",
--           ["x"] = "cut_to_clipboard",
--           ["p"] = "paste_from_clipboard",
--           ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
--           -- ["c"] = {
--           --  "copy",
--           --  config = {
--           --    show_path = "none" -- "none", "relative", "absolute"
--           --  }
--           --}
--           ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
--           ["q"] = "close_window",
--           ["R"] = "refresh",
--           ["?"] = "show_help",
--           ["<"] = "prev_source",
--           [">"] = "next_source",
--           ["i"] = "show_file_details",
--         }
--       },
--       nesting_rules = {},
--       filesystem = {
--         filtered_items = {
--           visible = false, -- when true, they will just be displayed differently than normal items
--           hide_dotfiles = true,
--           hide_gitignored = true,
--           hide_hidden = true, -- only works on Windows for hidden files/directories
--           hide_by_name = {
--             --"node_modules"
--           },
--           hide_by_pattern = { -- uses glob style patterns
--             --"*.meta",
--             --"*/src/*/tsconfig.json",
--           },
--           always_show = { -- remains visible even if other settings would normally hide it
--             --".gitignored",
--           },
--           always_show_by_pattern = { -- uses glob style patterns
--             --".env*",
--           },
--           never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
--             --".DS_Store",
--             --"thumbs.db"
--           },
--           never_show_by_pattern = { -- uses glob style patterns
--             --".null-ls_*",
--           },
--         },
--         follow_current_file = {
--           enabled = false, -- This will find and focus the file in the active buffer every time
--           --               -- the current file is changed while the tree is open.
--           leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
--         },
--         group_empty_dirs = false, -- when true, empty folders will be grouped together
--         hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
--                                                 -- in whatever position is specified in window.position
--                               -- "open_current",  -- netrw disabled, opening a directory opens within the
--                                                 -- window like netrw would, regardless of window.position
--                               -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
--         use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
--                                         -- instead of relying on nvim autocmd events.
--         window = {
--           mappings = {
--             ["<bs>"] = "navigate_up",
--             ["."] = "set_root",
--             ["H"] = "toggle_hidden",
--             ["/"] = "fuzzy_finder",
--             ["D"] = "fuzzy_finder_directory",
--             ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
--             -- ["D"] = "fuzzy_sorter_directory",
--             ["f"] = "filter_on_submit",
--             ["<c-x>"] = "clear_filter",
--             ["[g"] = "prev_git_modified",
--             ["]g"] = "next_git_modified",
--             ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
--             ["oc"] = { "order_by_created", nowait = false },
--             ["od"] = { "order_by_diagnostics", nowait = false },
--             ["og"] = { "order_by_git_status", nowait = false },
--             ["om"] = { "order_by_modified", nowait = false },
--             ["on"] = { "order_by_name", nowait = false },
--             ["os"] = { "order_by_size", nowait = false },
--             ["ot"] = { "order_by_type", nowait = false },
--             -- ['<key>'] = function(state) ... end,
--           },
--           fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
--             ["<down>"] = "move_cursor_down",
--             ["<C-n>"] = "move_cursor_down",
--             ["<up>"] = "move_cursor_up",
--             ["<C-p>"] = "move_cursor_up",
--             -- ['<key>'] = function(state, scroll_padding) ... end,
--           },
--         },
--
--         commands = {} -- Add a custom command or override a global one using the same function name
--       },
--       buffers = {
--         follow_current_file = {
--           enabled = true, -- This will find and focus the file in the active buffer every time
--           --              -- the current file is changed while the tree is open.
--           leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
--         },
--         group_empty_dirs = true, -- when true, empty folders will be grouped together
--         show_unloaded = true,
--         window = {
--           mappings = {
--             ["bd"] = "buffer_delete",
--             ["<bs>"] = "navigate_up",
--             ["."] = "set_root",
--             ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
--             ["oc"] = { "order_by_created", nowait = false },
--             ["od"] = { "order_by_diagnostics", nowait = false },
--             ["om"] = { "order_by_modified", nowait = false },
--             ["on"] = { "order_by_name", nowait = false },
--             ["os"] = { "order_by_size", nowait = false },
--             ["ot"] = { "order_by_type", nowait = false },
--           }
--         },
--       },
--       git_status = {
--         window = {
--           position = "float",
--           mappings = {
--             ["A"]  = "git_add_all",
--             ["gu"] = "git_unstage_file",
--             ["ga"] = "git_add_file",
--             ["gr"] = "git_revert_file",
--             ["gc"] = "git_commit",
--             ["gp"] = "git_push",
--             ["gg"] = "git_commit_and_push",
--             ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
--             ["oc"] = { "order_by_created", nowait = false },
--             ["od"] = { "order_by_diagnostics", nowait = false },
--             ["om"] = { "order_by_modified", nowait = false },
--             ["on"] = { "order_by_name", nowait = false },
--             ["os"] = { "order_by_size", nowait = false },
--             ["ot"] = { "order_by_type", nowait = false },
--           }
--         }
--       }
--     })
--
--     vim.cmd([[nnoremap <m-\> :Neotree toggle<cr>]])
--   end
-- },

}
