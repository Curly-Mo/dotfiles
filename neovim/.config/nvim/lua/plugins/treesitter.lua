return {
{
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "lewis6991/gitsigns.nvim",
  },
  -- event = "VeryLazy",
  cond = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    textobjects = { -- syntax-aware textobjects
      swap = {
        enable = true,
        swap_next = {
          ["<leader>sa"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>sA"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        -- goto_next_start = {
        --   ["]f"] = "@function.*",
        --   ["]e"] = "@block.*",
        --   ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
        -- },
        -- goto_next_end = {
        --   ["]F"] = "@function.*",
        --   ["]E"] = "@block.*",
        --   ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
        -- },
        -- goto_previous_start = {
        --   ["[f"] = "@function.*",
        --   ["[e"] = "@block.*",
        --   ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
        -- },
        -- goto_previous_end = {
        --   ["[F"] = "@function.*",
        --   ["[E"] = "@block.*",
        --   ["[S"] = { query = "@scope", query_group = "locals", desc = "Previous scope end" },
        -- },
        -- Below will go to either the start or the end, whichever is closer.
        goto_next = {
          ["]f"] = "@function.*",
          ["]e"] = "@block.*",
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
        },
        goto_previous = {
          ["[f"] = "@function.*",
          ["[e"] = "@block.*",
          ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
        },
      },
      select = {
        enable = true,
        disable = {},
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
        keymaps = {
          -- ["iL"] = { -- you can define your own textobjects directly here
          --   python = "(function_definition) @function",
          --   cpp = "(function_definition) @function",
          --   c = "(function_definition) @function",
          --   java = "(method_declaration) @function"
          -- },
          -- or you use the queries from supported languages with textobjects.scm
          -- ["ii"] = "@statement.inner",
          -- ["aa"] = "@statement.outer",
          ["is"] = "@statement.inner",
          ["as"] = "@statement.outer",
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["iC"] = "@class.inner",
          ["aC"] = "@class.outer",
          ["ic"] = "@conditional.inner",
          ["ac"] = "@conditional.outer",
          ["ie"] = "@block.inner",
          ["ae"] = "@block.outer",
          ["il"] = "@loop.inner",
          ["al"] = "@loop.outer",
          ["id"] = "@comment.inner",
          ["ad"] = "@comment.outer",
          ["im"] = "@call.inner",
          ["am"] = "@call.outer",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
    -- make movements repeatable with ; and ,
    -- local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
    -- replace ; and , keybinds with wrapper commands
    -- ensure ; goes forward and , goes backward regardless of the last direction
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    -- Optionally, make builtin f, F, t, T also repeatable with our new wrappers for ; and ,
    -- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    -- make gitsigns repeatable
    -- local gs = require("gitsigns")
    -- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
    -- -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.
    -- vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
    -- vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
  end,
},

{
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  cond = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
    -- by default, strip out new line characters
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value:gsub("%s+", " ")
      else
        return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
      end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  },
},

{
  "andymass/vim-matchup",
  -- enabled = false,
  opts = {
    enabled = true,
    matchparen = {
      enabled = true,
      offscreen = {
        method = "popup",
        -- method = "status",
        scrolloff = true,
        -- fullwidth = true,
        -- border = true,
      },
      -- singleton = false,
      stopline = 1500,
      timeout = 50,
      insert_timeout = 10,
      deferred = true,
      deferred_show_delay = 50,
      deferred_hide_delay = 10,
      deferred_fade_time = 0,
      -- pumvisible = 0,
      -- nomode = "",
      hi_surround_always = true,
      -- hi_background = false,
      -- end_sign = "◀",
    },
    delim = {
      stopline = 1500,
      -- noskips = 0,
      -- nomids = 0,
      -- start_plaintext = true,
    },
    treesitter = {
      enabled = true,
      -- disabled = {},
      include_match_words = true,
      -- disable_virtual_text = true,
      enable_quotes = false,
      stopline = 1500,
    },
    transmute = {
      enabled = true,
    },
    text_obj = {
      enabled = true,
      -- linewise_operators = { "d", "y" },
    },
    surround = {
      enabled = false,
    },
    motion = {
      enabled = true,
      -- override_Npercent = 6,
      -- cursor_end = 1,
    },
    mouse = {
      enabled = true,
    },
    mappings = {
      enabled = true,
    },
  },
  init = function()
    vim.cmd([[
      augroup matchup_matchparen_highlight
        autocmd!
        autocmd ColorScheme * hi MatchParen ctermfg=012 guifg=#b1d8f6 ctermbg=none
        autocmd ColorScheme * hi MatchWord ctermfg=012 guifg=#b1d8f6 ctermbg=none
        " autocmd ColorScheme * hi MatchParenCur ctermfg=012 guifg=#b1d8f6 ctermbg=none
        " autocmd ColorScheme * hi MatchWordCur ctermfg=012 guifg=#b1d8f6 ctermbg=none
      augroup END
    ]])
    vim.keymap.set({'n', 'v'}, '[[', "<Plug>(matchup-[%)", { noremap = false, desc = "matchup.prev" })
    vim.keymap.set({'n', 'v'}, ']]', "<Plug>(matchup-]%)", { noremap = false, desc = "matchup.next" })
    vim.keymap.set({'n', 'v'}, 'g>', "<Plug>(matchup-z%)", { noremap = false, desc = "matchup.inside" })
    vim.keymap.set({'n', 'v'}, 'g<', "<Plug>(matchup-g%)", { noremap = false, desc = "matchup.cycle" })
    vim.keymap.set({'n', 'v'}, 'g/', "<Plug>(matchup-g%)", { noremap = false, desc = "matchup.cycle" })
    vim.keymap.set({'n', 'v'}, 'gW', ":MatchupWhereAmI?<CR>", { noremap = false, desc = "matchup.status" })
  end,
  -- keys = {
  --   {{'n', 'v'}, "[[", "<Plug>(matchup-[%)", desc = "matchup.prev" },
  --   {{'n', 'v'}, "]]", "<Plug>(matchup-]%)", desc = "matchup.next" },
  -- },
},

{
  "nvim-treesitter/nvim-treesitter-context",
  -- enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  cond = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    local tsc = require('treesitter-context')
    tsc.setup{
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 25, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 2, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      vim.keymap.set("n", "[C", function()
        tsc.go_to_context(vim.v.count1)
      end, { silent = true, desc = "treesitter-context.go_to_context" })
    }
  end,
},

{
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "lewis6991/async.nvim",
  },
  -- lazy = false,
  opts = {
    prompt_func_return_type = {
      go = false,
      java = false,
      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = false,
      java = false,
      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = true, -- shows a message with information about the refactor on success
                                 -- i.e. [Refactor] Inlined 3 variable occurrences
  },
},

{
  "cshuaimin/ssr.nvim",
  opts = {
    border = "rounded",
    min_width = 50,
    min_height = 5,
    max_width = 120,
    max_height = 25,
    adjust_window = true,
    keymaps = {
      close = "q",
      next_match = "n",
      prev_match = "N",
      replace_confirm = "<cr>",
      replace_all = "<leader><cr>",
    },
  },
  keys = {
    {"<leader>sr", function() require("ssr").open() end, {'n', 'x'}, desc = "Structural search and replace" },
  },
},

{
  "HiPhish/rainbow-delimiters.nvim",
  cond = function()
    return not vim.opt.diff:get()
  end,
  config = function(_, options)
    local rainbow_delimiters = require('rainbow-delimiters')
    local opts = require("utils").default_opts(options){
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
        'RainbowDelimiterViolet',
      },
    }
    require("rainbow-delimiters.setup").setup(opts)
  end,
},

{
  "JoosepAlviste/nvim-ts-context-commentstring",
  dependencies = { "tpope/vim-commentary" },
  cond = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    enable_autocmd = false,
  },
  config = function(_, opts)
    require('ts_context_commentstring').setup(opts)
  end,
},

{
  "windwp/nvim-ts-autotag",
  cond = function()
    return not vim.opt.diff:get()
  end,
  opts = {
    opts = {
      -- Defaults
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = false, -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    -- per_filetype = {
    --   ["html"] = {
    --     enable_close = false,
    --   },
    -- },
  },
},

-- fallback for when treesj isn't cutting it
{
  "echasnovski/mini.splitjoin",
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    -- Created for both Normal and Visual modes.
    mappings = {
      toggle = '<C-J>',
      split = 'gJ',
      join = 'gj',
    },
    -- Detection options: where split/join should be done
    detect = {
      -- Array of Lua patterns to detect region with arguments.
      -- Default: { '%b()', '%b[]', '%b{}' }
      brackets = nil,
      -- String Lua pattern defining argument separator
      separator = ',',
      -- Array of Lua patterns for sub-regions to exclude separators from.
      -- Enables correct detection in presence of nested brackets and quotes.
      -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
      exclude_regions = nil,
    },
    -- Split options
    split = {
      hooks_pre = {},
      hooks_post = {},
    },
    -- Join options
    join = {
      hooks_pre = {},
      hooks_post = {},
    },
  },
  config = function(_, opts)
    require('mini.splitjoin').setup(opts)
    -- wrap join function to always fallback to vim.cmd.join if it fails for any reason
    local join = require('mini.splitjoin').join
    local toggle = require('mini.splitjoin').toggle
    require('mini.splitjoin').join = require("utils").with_fallback(join, vim.cmd.join)
    require('mini.splitjoin').toggle = require("utils").with_fallback(toggle, vim.cmd.join)
  end,
},
-- fallback for when treesj isn't cutting it
{
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.splitjoin",
  },
  event = "VeryLazy",
  opts = {
    ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
    use_default_keymaps = false,
    ---@type boolean Node with syntax error will not be formatted
    check_syntax_error = true,
    ---If line after join will be longer than max value,
    ---@type number If line after join will be longer than max value, node will not be formatted
    max_join_length = 999999999, -- 120,
    ---Cursor behavior:
    ---hold - cursor follows the node/place on which it was called
    ---start - cursor jumps to the first symbol of the node being formatted
    ---end - cursor jumps to the last symbol of the node being formatted
    ---@type 'hold'|'start'|'end'
    cursor_behavior = 'hold',
    ---@type boolean Notify about possible problems or not
    notify = true,
    ---@type boolean Use `dot` for repeat action
    dot_repeat = true,
    ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
    -- on_error = require('mini.splitjoin').toggle,
    -- on_error = vim.cmd.join,
    ---@type table Presets for languages
    -- langs = {}, -- See the default presets in lua/treesj/langs
  },
  keys = {
    { "<leader><C-J>", function() require('treesj').toggle() end, desc = "Join Toggle (treesj)" },
    { "<leader>gJ", function() require('treesj').split() end, desc = "Join Split (treesj)" },
    { "<leader>gj", function() require('treesj').join() end, desc = "Join (treesj)" },
    -- { "gJ", function() require('treesj').split() end, desc = "Join Split (treesj)" },
    -- { "gj", function() require('treesj').join() end, desc = "Join (treesj)" },
    -- { "<leader>J", "<cmd>TSJJoin<cr>", desc = "Join" },
    -- { "<leader>j", "<cmd>TSJSplit<cr>", desc = "Join Split" },
  },
  config = function(_, options)
    -- Add fallback to all language
    -- for _, nodes in pairs(langs) do
    --   for _, node in ipairs(nodes) do
    --     node.fallback = function(ts_node)
    --       require('mini.splitjoin').toggle()
    --     end
    --   end
    -- end
    require('treesj').setup(require("utils").default_opts(options){
    })
    -- configure custom fallbacks for whenever treesj errors
    local toggle = require('treesj').toggle
    local join = require('treesj').join
    local split = require('treesj').split
    require('treesj').toggle = require("utils").with_fallback(toggle, require('mini.splitjoin').toggle)
    require('treesj').join = require("utils").with_fallback(join, require('mini.splitjoin').join)
    require('treesj').split = require("utils").with_fallback(split, require('mini.splitjoin').split)
    -- configure fallback for unsupported langs https://github.com/Wansmer/treesj/discussions/19
    local langs = require('treesj.langs')['presets']
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = '*',
      callback = function()
        local opts = require("utils").default_opts({ buffer = true })
        if langs[vim.bo.filetype] then
          -- vim.keymap.set('n', 'J', require('treesj').toggle, opts({desc = "treesj toggle"}))
          -- vim.keymap.set('n', '<C-J>', require('treesj').split, opts({desc = "Split (treesj)"}))
          -- vim.keymap.set('n', '<C-j>', require('treesj').join, opts({desc = "Join (treesj)"}))
          -- -- vim.keymap.set('n', '<leader>j', require('treesj').join, opts({desc = "Join (treesj)"}))
          -- -- vim.keymap.set('n', '<leader>J', require('treesj').split, opts({desc = "Split (treesj)"}))
        else
          vim.keymap.set('n', 'J', require('mini.splitjoin').toggle, opts({desc = "Toggle (mini.splitjoin)"}))
          vim.keymap.set('n', '<c-J>', require('mini.splitjoin').split, opts({desc = "Split (mini.splitjoin)"}))
          vim.keymap.set('n', '<c-j>', require('mini.splitjoin').join, opts({desc = "Join (mini.splitjoin)"}))
          vim.keymap.set('n', 'gJ', require('mini.splitjoin').split, opts({desc = "Split (mini.splitjoin)"}))
          vim.keymap.set('n', 'gj', require('mini.splitjoin').join, opts({desc = "Join (mini.splitjoin)"}))
          -- vim.keymap.set('n', '<leader>j', require('mini.splitjoin').join, opts({desc = "join (mini.splitjoin)"}))
          -- vim.keymap.set('n', '<leader>J', require('mini.splitjoin').split, opts({desc = "split (mini.splitjoin)"}))
        end
      end,
    })
  end,
},

{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  opts = {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (or "all")
    ignore_install = { },
    highlight = {
      enable = true,                    -- false will disable the whole extension
      disable = { "csv", "tsv",  },     -- list of language that will be disabled
      custom_captures = {               -- mapping of user defined captures to highlight groups
        -- ["foo.bar"] = "Identifier"   -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
      },
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      disable = { },
      keymaps = {                       -- mappings for incremental selection (visual mappings)
        init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
        node_incremental = "gNn",       -- increment to the upper named parent
        scope_incremental = "gNc",      -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "gNm",       -- decrement to the previous node
      }
    },
    indent = {
      enable = true,
      disable = {"lua"},
    },
    folds = {
      enable = false
    },
  },
  init = function()
    local ensure_installed = {
      "bash",
      "c",
      "cmake",
      "commonlisp",
      "cpp",
      "comment",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "editorconfig",
      "git_config",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gpg",
      "graphql",
      "hjson",
      "hocon",
      "html",
      "http",
      "java",
      "javadoc",
      "javascript",
      "jinja",
      "jinja_inline",
      "jq",
      "jsdoc",
      "json",
      "json5",
      "latex",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "matlab",
      "nginx",
      "printf",
      "properties",
      "proto",
      "pymanifest",
      "python",
      "regex",
      "rst",
      "ruby",
      "rust",
      "scala",
      "scss",
      "tmux",
      "todotxt",
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xresources",
      "yaml",
    }
    local already_installed = require('nvim-treesitter.config').get_installed()
    local parsers_to_install = vim.iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsers_to_install)
  end,
},

}
