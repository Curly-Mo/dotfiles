return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
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
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
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

        vim.keymap.set("n", "[c", function()
          tsc.go_to_context(vim.v.count1)
        end, { silent = true })
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
			local configs = require("nvim-treesitter.configs")
      configs.setup {
        highlight = {
          enable = true,                    -- false will disable the whole extension
          disable = { },                    -- list of language that will be disabled
          custom_captures = {               -- mapping of user defined captures to highlight groups
            -- ["foo.bar"] = "Identifier"   -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
          },
        },
        incremental_selection = {
          enable = true,
          disable = { },
          keymaps = {                       -- mappings for incremental selection (visual mappings)
            init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
            node_incremental = "grn",       -- increment to the upper named parent
            scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
            node_decremental = "grm",       -- decrement to the previous node
          }
        },
        refactor = {
          highlight_definitions = {
            enable = true
          },
          highlight_current_scope = {
            enable = false
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr"          -- mapping to rename reference under cursor
            }
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",      -- mapping to go to definition of symbol under cursor
              list_definitions = "gnD"      -- mapping to list all definitions in current file
            }
          }
        },
        matchup = {
          enable = true,              -- mandatory, false will disable the whole extension
          disable = { },  -- optional, list of language that will be disabled
          include_match_words = true,
        },
        textobjects = { -- syntax-aware textobjects
          enable = true,
          disable = {},
          keymaps = {
              ["iL"] = { -- you can define your own textobjects directly here
                python = "(function_definition) @function",
                cpp = "(function_definition) @function",
                c = "(function_definition) @function",
                java = "(method_declaration) @function"
              },
              -- or you use the queries from supported languages with textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["aC"] = "@class.outer",
              ["iC"] = "@class.inner",
              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["ae"] = "@block.outer",
              ["ie"] = "@block.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["is"] = "@statement.inner",
              ["as"] = "@statement.outer",
              ["ad"] = "@comment.outer",
              ["am"] = "@call.outer",
              ["im"] = "@call.inner"
          }
        },
        ensure_installed = {
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
          "html",
          "http",
          "java",
          "javascript",
          "json",
          "json5",
          "latex",
          "lua",
          "make",
          "markdown",
          "python",
          "regex",
          "rst",
          "ruby",
          "rust",
          "scala",
          "scss",
          "todotxt",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (or "all")
        ignore_install = { },
      }
    end,
  },
}
