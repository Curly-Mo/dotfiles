return {
{
  "junegunn/fzf",
  build = "./install --all",
},

{
  "junegunn/fzf.vim",
  init = function()
    vim.g.fzf_layout = { window = { width=0.99, height=0.99 } }
    -- vim.g.fzf_preview_window = { right='50%', 'ctrl-/'}
    vim.g.fzf_history_dir = vim.env.NVIM_TMP_DIR .. "/fzf-history"
    -- TODO: experimental, remove these
    -- let g:fzf_preview_use_dev_icons = 1
    -- let g:fzf_preview_command = 'bat --color=always --plain {-1}'
    -- fzf cd
    vim.cmd([[
      command! -bang -bar -nargs=? -complete=dir C
          \ call fzf#run(fzf#wrap(
          \ {'source': 'fd --type d --hidden --exclude .git',
          \ 'sink': 'cd'}))
    ]])
  end,
  config = function()
    vim.cmd [[
    "let g:fzf_vim.command_prefix = 'Fzf'
    ]]
    -- vim.g.fzf_vim.command_prefix = "Fzf"
  end,
},

{
  "stsewd/fzf-checkout.vim",
  event = "VeryLazy",
  keys = {
    { "<leader>gc", "<cmd>GBranches<cr>", desc = "fzf checkout git branch", },
  },
  opts = {
  },
  config = function()
  end,
},

{
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = false,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
},

{
  "nvim-telescope/telescope-ui-select.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        }
        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("ui-select")
  end,
},

{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    extensions = {
      file_browser = {
        -- theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        -- hijack_netrw = true,
        grouped = true,
        depth = 1,
        auto_depth = true,
        follow_symlinks = true,
        -- display_stat = { date = false, size = false, mode = false },
        display_stat = false,
        git_status = true,
        layout_config = {
          preview_width = 0.6,
        },
        -- mappings = {
        --   ["i"] = {
        --   },
        --   ["n"] = {
        --   },
        -- },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
  end,
  keys = {
    {'<leader>fk', function() require('telescope').extensions.file_browser.file_browser() end},
    {'<M-k>', function() require('telescope').extensions.file_browser.file_browser() end},
    {'<M-l>', function() require('telescope').extensions.file_browser.file_browser() end},
  },
},

{
  "debugloop/telescope-undo.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = "undo history", },
    { "<M-u>", "<cmd>Telescope undo<cr>", desc = "undo history", },
    -- {'<C-p>', function()
    --     require("telescope").extensions.frecency.frecency({workspaces={["GROOT"] = require("custom.utils").groot()}, cwd=require("custom.utils").groot()})
    --   end
    -- },
    {'<M-p>', function()
        require("telescope").extensions.frecency.frecency({workspaces={["GROOT"] = require("custom.utils").groot()}, cwd=require("custom.utils").groot()})
      end
    },
  },
  opts = {
    extensions = {
      undo = {
        use_delta = true,
        use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
        side_by_side = true,
        vim_diff_opts = {
          -- ctxlen = vim.o.scrolloff,
          -- ctxlen = vim.api.nvim_win_get_height(0),
          ctxlen = 3,
        },
        entry_format = "#$ID, $STAT, $TIME",
        time_format = "",
        saved_only = false,
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.80,
        },
      },
    },
  },
  config = function(_, opts)
    -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    -- defaults, as well as each extension).
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
},

{
  "nvim-telescope/telescope-frecency.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons", },
  opts = {
    extensions = {
      frecency = {
        auto_validate = true,
        bootstrap = true,
        matcher = "default",
        -- matcher = "fuzzy",
        path_display = {
          filename_first = { reverse_directories = true },
        },
        -- path_display = function(_, path)
        --   local rel_path = require("custom.utils").relative_path(path, vim.fn.getcwd(), require("custom.utils").groot())
        --   -- local rel_path = require("custom.utils").relative_path(path, vim.fn.getcwd())
        --   -- return rel_path
        --   return require("telescope.utils").path_smart(rel_path)
        -- end,
        default_workspace = "CWD",
        max_timestamps = 30,
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = {
          "*.git/*",
          "*/tmp/*",
          "term://*",
          "*/lua-language-server/*",
        },
        workspaces = {
          ["DOTS"] = vim.env.DOTS_DIR,
          ["SYNC"] = vim.env.SYNC_DIR,
          ["NOTES"] = vim.env.NOTES_DIR,
          ["TODO"] = vim.env.TODO_DIR,
          ["WORK"] = vim.env.WORK_DIR,
          ["PERSONAL"] = vim.env.PERSONAL_DIR,
          ["PACKAGES"] = vim.env.PACKAGES_DIR,
        },
        show_filter_column = false,
        -- show_filter_column = {
        --   "DOTS",
        --   "SYNC",
        --   "NOTES",
        --   "TODO",
        --   "WORK",
        --   "PERSONAL",
        --   "PACKAGES",
        -- },
        recency_values = {
          { age = 240, value = 100 }, -- past 4 hours
          { age = 1440, value = 80 }, -- past day
          { age = 4320, value = 60 }, -- past 3 days
          { age = 10080, value = 40 }, -- past week
          { age = 43200, value = 20 }, -- past month
          { age = 129600, value = 10 }, -- past 90 days
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("frecency")
  end,
},

-- {
--   'prochri/telescope-all-recent.nvim',
--   dependencies = {
--     "nvim-telescope/telescope.nvim",
--     "kkharji/sqlite.lua",
--     -- optional, if using telescope for vim.ui.select
--     "stevearc/dressing.nvim"
--   },
--   opts = {
--     database = {
--       folder = vim.fn.stdpath("data"),
--       file = "telescope-all-recent.sqlite3",
--       max_timestamps = 30,
--     },
--     debug = false,
--     scoring = {
--       recency_modifier = { -- also see telescope-frecency for these settings
--         [1] = { age = 240, value = 100 }, -- past 4 hours
--         [2] = { age = 1440, value = 80 }, -- past day
--         [3] = { age = 4320, value = 60 }, -- past 3 days
--         [4] = { age = 10080, value = 40 }, -- past week
--         [5] = { age = 43200, value = 20 }, -- past month
--         [6] = { age = 129600, value = 10 } -- past 90 days
--       },
--       -- how much the score of a recent item will be improved.
--       boost_factor = 0.0001
--     },
--     default = {
--       disable = true, -- disable any unkown pickers (recommended)
--       use_cwd = true, -- differentiate scoring for each picker based on cwd
--       sorting = 'frecency', -- sorting: options: 'recent' and 'frecency'
--     },
--     pickers = { -- allows you to overwrite the default settings for each picker
--       man_pages = { -- enable man_pages picker. Disable cwd and use frecency sorting.
--         disable = false,
--         use_cwd = false,
--       },
--       vim_options = {
--         disable = false,
--       },
--       pickers = {
--         disable = false,
--       },
--       builtin = {
--         disable = false,
--       },
--       planets = {
--         disable = false,
--       },
--       commands = {
--         disable = false,
--       },
--       help_tags = {
--         disable = false,
--       },
--       find_files = {
--         disable = false,
--       },
--       git_files = {
--         disable = false,
--       },
--       tags = {
--         disable = false,
--       },
--       git_commits = {
--         disable = false,
--       },
--       git_branches = {
--         disable = false,
--       },
--       -- change settings for a telescope extension.
--       -- To find out about extensions, you can use `print(vim.inspect(require'telescope'.extensions))`
--       -- ['extension_name#extension_method'] = {
--       --   -- [...]
--       -- }
--     },
--   },
-- },

{
  "danielfalk/smart-open.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional. If installed, native fzy will be used when match_algorithm is fzy
    -- { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  opts = {
    extensions = {
      smart_open = {
        match_algorithm = "fzf",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("smart_open")
  end,
  keys = {
    {'<C-p>', function() require('telescope').extensions.smart_open.smart_open({cwd_only = false,}) end},
  },
},

{
  "illia-shkroba/telescope-completion.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("completion")
  end,
  keys = {
    {
      "<C-q>",
      function()
        require('telescope').extensions.completion.completion()
        -- if vim.fn.pumvisible() == 1 then
        --   require('telescope').extensions.completion.completion()
        --   return ""
        -- else
        --   return [[<C-q>]]
        -- end
      end,
      mode = "i",
      expr = true,
      desc = "select completion with telescope",
    },
  },
},

{
  "nvim-telescope/telescope-github.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("gh")
  end,
},

{
  "cljoly/telescope-repo.nvim",
  dependencies = { 'nvim-telescope/telescope.nvim', "nvim-lua/plenary.nvim", },
  opts = {
    extensions = {
      repo = {
        settings = {
          auto_lcd = true,
        },
        list = {
          -- fd_opts = {
          --   -- "--no-ignore-vcs",
          -- },
          -- tail_path = true,
          -- shorten_path = true,
          search_dirs = {
            "~/workspace",
            "~/personal",
            "~/packages",
          },
        },
        cached_list = {
          file_ignore_patterns = {"/%."},
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("repo")
  end,
  keys = {
    -- {'<M-r>', function() require('telescope').extensions.repo.list({}) end},
    {'<M-r>', function() require('telescope').extensions.repo.cached_list({}) end},
  },
},

{
  "nvim-telescope/telescope.nvim",
  -- tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    Project_files = function(opts)
      if require("custom.utils").is_inside_work_tree() then
        require("telescope.builtin").git_files(opts)
      else
        require("telescope.builtin").find_files(opts)
      end
    end

    local telescope = require('telescope')
    telescope.setup{
      defaults = {
        find_command = {"fd", "--type=file", "--hidden", "--follow", "--exclude=.git", "--full-path"},
        -- find_command = {"fd", "--type=file", "--hidden", "--exclude=.git", "--full-path", "|", "proximity-sort", vim.fn.expand('%:p:h')},
        -- file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
        color_devicons = true,
        dynamic_preview_title = true,
        preview = {
          treesitter = true,
          ls_short = true,
        },
        layout_config = {
          horizontal = {
            width = 0.99,
            height = 0.99,
            preview_width = 0.55,
            preview_cutoff = 0,
          },
        },
        path_display = {
          filename_first = { reverse_directories = true },
          shorten = { len = 1, exclude = {1, -2, -1} },
          "smart",
          "truncate",
        },
        -- path_display = {
        --   shorten = { len = 1, exclude = {1, -2, -1} },
        -- },
        -- sorting_strategy = "descending",
        -- selection_strategy = "reset",
        -- scroll_strategy = "cycle",
        -- layout_strategy = "horizontal",
        prompt_prefix = "▶ ",
        selection_caret = "▶ ",
        -- border = false,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--follow",
          "--glob=!.git/",
        },
        -- these should be overridden by fzf-native plugin
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        generic_sorter = require("telescope.sorters").get_fzy_sorter,
        prefilter_sorter = require("telescope.sorters").prefilter,
        file_ignore_patterns = { "%.npz" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key"
            ["<esc>"] = "close",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          }
        },
      },
      pickers = {
        find_files = {
          find_command = {"fd", "--type=file", "--hidden", "--follow", "--exclude=.git", "--full-path"},
          -- find_command = {"fd", "--type=file", "--hidden", "--exclude=.git", "--full-path", "|", "proximity-sort", vim.fn.expand('%:p:h')},
          -- file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
        },
      },
      extensions = {
      },
    }
  end,
  keys = {
    -- {'<C-p>', function() require('telescope.builtin').find_files() end},
    {'<C-g>', function() Project_files() end},
    -- {'<M-p>', function() require('telescope.builtin').find_files() end},
    {'<leader>s', function() require('telescope.builtin').find_files() end},
    {'<leader>ff', function() require('telescope.builtin').find_files() end},
    {'<M-w>', function() require('telescope.builtin').grep_string() end},
    -- {'<C-[>', function() require('telescope.builtin').live_grep() end},
    {'<leader>fg', function() require('telescope.builtin').live_grep() end},
    {'<M-g>', function() require('telescope.builtin').live_grep() end},
    {'<C-b>', function() require('telescope.builtin').buffers() end},
    {'<M-b>', function() require('telescope.builtin').buffers() end},
    {'<leader>fb', function() require('telescope.builtin').buffers() end},
    {'<leader>fh', function() require('telescope.builtin').help_tags() end},
    {'<M-t>', function() require('telescope.builtin').help_tags() end},
    -- {'<M-r>', function() require('telescope.builtin').lsp_references() end},
    -- {'<M-r>', function() require('telescope.builtin').lsp_definitions() end},
    -- {'<M-r>', function() require('telescope.builtin').lsp_definitions() end},
  },
},

}
