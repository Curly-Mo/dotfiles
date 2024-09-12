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
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "stsewd/fzf-checkout.vim",
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons", },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { "<leader>u", "<cmd>Telescope undo<cr>", desc = "undo history", },
      { "<M-u>", "<cmd>Telescope undo<cr>", desc = "undo history", },
    },
    opts = {
      extensions = {
        undo = {
          side_by_side = true,
          -- layout_strategy = "vertical",
          layout_config = {
            preview_width = 0.6,
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
    "nvim-telescope/telescope.nvim",
    -- tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
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
          file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
          color_devicons = true,
          dynamic_preview_title = true,
          path_display = {
            "smart",
            "truncate",
          },
          -- path_display = {"smart"},
          -- path_display = {"filename_first"},
          -- path_display = function(opts, path)
          --   local tail = require("telescope.utils").path_tail(path)
          --   return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
          -- end,
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
          layout_config = {
            width = 0.99,
            height = 0.99,
            preview_width = 0.5,
            preview_cutoff = 0,
          },
        },
        pickers = {
          find_files = {
            find_command = {"fd", "--type=file", "--hidden", "--follow", "--exclude=.git", "--full-path"},
            -- find_command = {"fd", "--type=file", "--hidden", "--exclude=.git", "--full-path", "|", "proximity-sort", vim.fn.expand('%:p:h')},
            file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = false,
            case_mode = "smart_case",
          },
          file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            -- hijack_netrw = true,
            -- mappings = {
            --   ["i"] = {
            --   },
            --   ["n"] = {
            --   },
            -- },
          },
          frecency = {
            auto_validate = true,
            bootstrap = true,
            matcher = "default",
            -- matcher = "fuzzy",
            -- path_display = { "smart" },
            -- path_display = { "filename_first" },
            -- path_display = { "absolute" },
            -- path_display = {
            --   "truncate",
            -- },
            path_display = function(_, path)
              local rel_path = require("custom.utils").relative_path(path, vim.fn.getcwd(), require("custom.utils").groot())
              -- local rel_path = require("custom.utils").relative_path(path, vim.fn.getcwd())
              -- return rel_path
              return require("telescope.utils").path_smart(rel_path)
            end,
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
      }
    end,
    keys = {
      {'<C-p>', function() require('telescope.builtin').find_files() end},
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
      {'<M-r>', function() require('telescope.builtin').lsp_definitions() end},
      -- {'<leader>fk', function() require('telescope').extensions.file_browser.file_browser() end},
      {'<M-k>', function() require('telescope').extensions.file_browser.file_browser() end},
      {'<M-l>', function() require('telescope').extensions.file_browser.file_browser() end},
      {'<M-u>', function() require('telescope').extensions.undo.undo() end},
      -- {'<C-p>', function()
      --     require("telescope").extensions.frecency.frecency({workspaces={["GROOT"] = require("custom.utils").groot()}, cwd=require("custom.utils").groot()})
      --   end
      -- },
      {'<M-p>', function()
          -- require("telescope").extensions.frecency.frecency()
          -- require("telescope").extensions.frecency.frecency({workspace = 'CWD'})
          -- require("telescope").extensions.frecency.frecency({cwd=require("custom.utils").groot()})
          require("telescope").extensions.frecency.frecency({workspaces={["GROOT"] = require("custom.utils").groot()}, cwd=require("custom.utils").groot()})
          -- local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
          -- if vim.v.shell_error == 0 then
          --   require("telescope").extensions.frecency.frecency({ workspace = root})
          -- else
          --   require("telescope").extensions.frecency.frecency({})
          -- end
        end
      },
    },
  },
}
