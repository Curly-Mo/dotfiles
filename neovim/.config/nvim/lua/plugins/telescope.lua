return {
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    config = function()
      vim.cmd [[
      "let g:fzf_vim.command_prefix = 'Fzf'
      ]]
      -- vim.g.fzf_vim.command_prefix = "Fzf"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "stsewd/fzf-checkout.vim",
  },
  {
    "nvim-telescope/telescope.nvim",
    -- tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      function Split(s, delimiter)
        local result = {};
        for match in (s..delimiter):gmatch("(.-)"..delimiter) do
          table.insert(result, match);
        end
        return result;
      end
      local telescope = require('telescope')
      telescope.setup{
        defaults = {
          find_command = {"fd", "--type=file", "--hidden", "--exclude=.git", "--full-path"},
          -- find_command = {"fd", "--type=file", "--hidden", "--exclude=.git", "--full-path", "|", "proximity-sort", vim.fn.expand('%:p:h')},
          -- TODO: figure out how to hack this
          -- find_command = {Split(vim.fn['Fd_cmd'](), ' ')},
          file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
          color_devicons = true,
          dynamic_preview_title = true,
          path_display = {
            "smart",
            "truncate",
          },
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
            width = 0.95,
            preview_width = 0.45,
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
        },
      }
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")

      local builtin = require('telescope.builtin')
      -- vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>s', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<M-p>', builtin.grep_string, {})
      -- vim.keymap.set('n', '<C-[>', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<C-b>', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fk', telescope.extensions.file_browser.file_browser, {})
    end,
  },
}
