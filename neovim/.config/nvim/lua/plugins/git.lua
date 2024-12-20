return {
-- {
--   "airblade/vim-gitgutter",
-- },

{
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      delay = 3000,
      ignore_whitespace = true,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
  },
  config = function(_, opts)
    require('gitsigns').setup(require("utils").default_opts(opts){
      on_attach = function(bufnr)
        -- Navigation
        local opts = require("utils").default_opts({ buffer = bufnr })
        vim.keymap.set('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({']h', bang = true})
          else
            require('gitsigns').nav_hunk('next')
          end
        end, opts({ desc = "next hunk" }))
        vim.keymap.set('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({'[h', bang = true})
          else
            require('gitsigns').nav_hunk('prev')
          end
        end, opts({ desc = "prev hunk" }))
        -- Actions
        vim.keymap.set('n', 'ghs', require('gitsigns').stage_hunk, opts({ desc = "stage hunk" }))
        vim.keymap.set('n', 'ghr', require('gitsigns').reset_hunk, opts({ desc = "reset hunk" }))
        vim.keymap.set('n', 'ghu', require('gitsigns').undo_stage_hunk, opts({ desc = "undo stage hunk" }))
        vim.keymap.set('n', 'ghp', require('gitsigns').preview_hunk, opts({ desc = "preview hunk" }))
        vim.keymap.set('n', 'ghb', function() require('gitsigns').blame_line{full=true} end, opts({ desc = "blame line" }))
        vim.keymap.set('n', 'ghd', require('gitsigns').diffthis, opts({ desc = "gitsigns.diffthis" }))
        vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk, opts({ desc = "stage hunk" }))
        vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, opts({ desc = "reset hunk" }))
        vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts({ desc = "stage hunk" }))
        vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts({ desc = "reset hunk" }))
        vim.keymap.set('n', '<leader>hS', require('gitsigns').stage_buffer, opts({ desc = "stage buffer" }))
        vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk, opts({ desc = "undo stage hunk" }))
        vim.keymap.set('n', '<leader>hR', require('gitsigns').reset_buffer, opts({ desc = "reset buffer" }))
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, opts({ desc = "preview hunk" }))
        vim.keymap.set('n', '<leader>hb', function() require('gitsigns').blame_line{full=true} end, opts({ desc = "blame line" }))
        vim.keymap.set('n', '<leader>hB', require('gitsigns').toggle_current_line_blame, opts({ desc = "toggle current line blame" }))
        vim.keymap.set('n', '<leader>hd', require('gitsigns').diffthis, opts({ desc = "gitsigns.diffthis" }))
        vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, opts({ desc = "gitsigns.diffthis('~')" }))
        vim.keymap.set('n', '<leader>td', require('gitsigns').toggle_deleted, opts({ desc = "gitsigns.toggle_deleted" }))
        -- Text object
        vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts({ desc = "select hunk" }))
      end,
    })
  end,
},

{
  "sindrets/diffview.nvim",
},

{
  "rhysd/conflict-marker.vim",
},

{
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      -- Hides the hints at the top of the status buffer
      disable_hint = false,
      -- Disables changing the buffer highlights based on where the cursor is.
      disable_context_highlighting = false,
      -- Disables signs for sections/items/hunks
      disable_signs = false,
      -- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
      -- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
      -- normal mode.
      disable_insert_on_commit = "auto",
      -- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
      -- events.
      filewatcher = {
        interval = 1000,
        enabled = true,
      },
      -- "ascii"   is the graph the git CLI generates
      -- "unicode" is the graph like https://github.com/rbong/vim-flog
      graph_style = "ascii",
      -- Used to generate URL's for branch popup action "pull request".
      git_services = {
        ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
        ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
        ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
        ["azure.com"] = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
      },
      -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
      -- sorter instead. By default, this function returns `nil`.
      telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end,
      -- Persist the values of switches/options within and across sessions
      remember_settings = true,
      -- Scope persisted settings on a per-project basis
      use_per_project_settings = true,
      -- Table of settings to never persist. Uses format "Filetype--cli-value"
      ignored_settings = {
        "NeogitPushPopup--force-with-lease",
        "NeogitPushPopup--force",
        "NeogitPullPopup--rebase",
        "NeogitCommitPopup--allow-empty",
        "NeogitRevertPopup--no-edit",
      },
      -- Configure highlight group features
      highlight = {
        italic = true,
        bold = true,
        underline = true
      },
      -- Set to false if you want to be responsible for creating _ALL_ keymappings
      use_default_keymaps = true,
      -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
      -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
      auto_refresh = true,
      -- Value used for `--sort` option for `git branch` command
      -- By default, branches will be sorted by commit date descending
      -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
      -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
      sort_branches = "-committerdate",
      -- Change the default way of opening neogit
      kind = "tab",
      -- Disable line numbers and relative line numbers
      disable_line_numbers = true,
      -- The time after which an output console is shown for slow running commands
      console_timeout = 2000,
      -- Automatically show console if a command takes more than console_timeout milliseconds
      auto_show_console = true,
      -- Automatically close the console if the process exits with a 0 (success) status
      auto_close_console = true,
      status = {
        show_head_commit_hash = true,
        recent_commit_count = 10,
        HEAD_padding = 10,
        HEAD_folded = false,
        mode_padding = 3,
        mode_text = {
          M = "modified",
          N = "new file",
          A = "added",
          D = "deleted",
          C = "copied",
          U = "updated",
          R = "renamed",
          DD = "unmerged",
          AU = "unmerged",
          UD = "unmerged",
          UA = "unmerged",
          DU = "unmerged",
          AA = "unmerged",
          UU = "unmerged",
          ["?"] = "",
        },
      },
      commit_editor = {
        kind = "tab",
        show_staged_diff = true,
        -- Accepted values:
        -- "split" to show the staged diff below the commit editor
        -- "vsplit" to show it to the right
        -- "split_above" Like :top split
        -- "vsplit_left" like :vsplit, but open to the left
        -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
        staged_diff_split_kind = "split"
      },
      commit_select_view = {
        kind = "tab",
      },
      commit_view = {
        kind = "vsplit",
        verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
      },
      log_view = {
        kind = "tab",
      },
      rebase_editor = {
        kind = "auto",
      },
      reflog_view = {
        kind = "tab",
      },
      merge_editor = {
        kind = "auto",
      },
      tag_editor = {
        kind = "auto",
      },
      preview_buffer = {
        kind = "split",
      },
      popup = {
        kind = "split",
      },
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
      },
      -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
      integrations = {
        -- If enabled, use telescope for menu selection rather than vim.ui.select.
        -- Allows multi-select and some things that vim.ui.select doesn't.
        telescope = nil,
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
        -- The diffview integration enables the diff popup.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        diffview = nil,
        -- If enabled, uses fzf-lua for menu selection. If the telescope integration
        -- is also selected then telescope is used instead
        -- Requires you to have `ibhagwan/fzf-lua` installed.
        fzf_lua = nil,
      },
      sections = {
        -- Reverting/Cherry Picking
        sequencer = {
          folded = false,
          hidden = false,
        },
        untracked = {
          folded = false,
          hidden = false,
        },
        unstaged = {
          folded = false,
          hidden = false,
        },
        staged = {
          folded = false,
          hidden = false,
        },
        stashes = {
          folded = true,
          hidden = false,
        },
        unpulled_upstream = {
          folded = true,
          hidden = false,
        },
        unmerged_upstream = {
          folded = false,
          hidden = false,
        },
        unpulled_pushRemote = {
          folded = true,
          hidden = false,
        },
        unmerged_pushRemote = {
          folded = false,
          hidden = false,
        },
        recent = {
          folded = true,
          hidden = false,
        },
        rebase = {
          folded = true,
          hidden = false,
        },
      },
      mappings = {
        commit_editor = {
          ["q"] = "Close",
          ["<c-c><c-c>"] = "Submit",
          ["<c-c><c-k>"] = "Abort",
        },
        commit_editor_I = {
          ["<c-c><c-c>"] = "Submit",
          ["<c-c><c-k>"] = "Abort",
        },
        rebase_editor = {
          ["p"] = "Pick",
          ["r"] = "Reword",
          ["e"] = "Edit",
          ["s"] = "Squash",
          ["f"] = "Fixup",
          ["x"] = "Execute",
          ["d"] = "Drop",
          ["b"] = "Break",
          ["q"] = "Close",
          ["<cr>"] = "OpenCommit",
          ["gk"] = "MoveUp",
          ["gj"] = "MoveDown",
          ["<c-c><c-c>"] = "Submit",
          ["<c-c><c-k>"] = "Abort",
          ["[c"] = "OpenOrScrollUp",
          ["]c"] = "OpenOrScrollDown",
        },
        rebase_editor_I = {
          ["<c-c><c-c>"] = "Submit",
          ["<c-c><c-k>"] = "Abort",
        },
        finder = {
          ["<cr>"] = "Select",
          ["<c-c>"] = "Close",
          ["<esc>"] = "Close",
          ["<c-n>"] = "Next",
          ["<c-p>"] = "Previous",
          ["<down>"] = "Next",
          ["<up>"] = "Previous",
          ["<tab>"] = "MultiselectToggleNext",
          ["<s-tab>"] = "MultiselectTogglePrevious",
          ["<c-j>"] = "NOP",
        },
        -- Setting any of these to `false` will disable the mapping.
        popup = {
          ["?"] = "HelpPopup",
          ["A"] = "CherryPickPopup",
          ["D"] = "DiffPopup",
          ["M"] = "RemotePopup",
          ["P"] = "PushPopup",
          ["X"] = "ResetPopup",
          ["Z"] = "StashPopup",
          ["b"] = "BranchPopup",
          ["B"] = "BisectPopup",
          ["c"] = "CommitPopup",
          ["f"] = "FetchPopup",
          ["l"] = "LogPopup",
          ["m"] = "MergePopup",
          ["p"] = "PullPopup",
          ["r"] = "RebasePopup",
          ["v"] = "RevertPopup",
          ["w"] = "WorktreePopup",
        },
        status = {
          -- ["k"] = "MoveUp",
          -- ["j"] = "MoveDown",
          ["q"] = "Close",
          -- ["o"] = "OpenTree",
          ["I"] = "InitRepo",
          ["1"] = "Depth1",
          ["2"] = "Depth2",
          ["3"] = "Depth3",
          ["4"] = "Depth4",
          ["<tab>"] = "Toggle",
          ["x"] = "Discard",
          ["s"] = "Stage",
          ["S"] = "StageUnstaged",
          ["<c-s>"] = "StageAll",
          ["K"] = "Untrack",
          ["u"] = "Unstage",
          ["U"] = "UnstageStaged",
          ["$"] = "CommandHistory",
          ["Y"] = "YankSelected",
          ["<c-r>"] = "RefreshBuffer",
          ["<enter>"] = "GoToFile",
          ["<c-v>"] = "VSplitOpen",
          ["<c-x>"] = "SplitOpen",
          ["<c-t>"] = "TabOpen",
          ["{"] = "GoToPreviousHunkHeader",
          ["}"] = "GoToNextHunkHeader",
          ["[c"] = "OpenOrScrollUp",
          ["]c"] = "OpenOrScrollDown",
        },
      },
    }
  end,
},

}
