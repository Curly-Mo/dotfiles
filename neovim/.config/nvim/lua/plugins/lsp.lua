return {
-- extras
{
  "j-hui/fidget.nvim",
  dependencies = { "rcarriga/nvim-notify", },
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
        format_message =            -- How to format a progress message
          require("fidget.progress.display").default_format_message,
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
      configs =                     -- How to configure notification groups when instantiated
        { default = require("fidget.notification").default_config },
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
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_close = false, -- auto close when there are no items
    auto_open = false, -- auto open when there are items
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = true, -- auto refresh when open
    auto_jump = false, -- auto jump to the item when there's only one
    focus = false, -- Focus the window when opened
    restore = true, -- restores the last location in the list when opening
    follow = true, -- Follow the current item
    indent_guides = true, -- show indent guides
    max_items = 200, -- limit number of items that can be displayed per section
    multiline = true, -- render multi-line messages
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
    ---@type trouble.Window.opts
    win = {}, -- window options for the results window. Can be a split or a floating window.
    -- Window options for the preview window. Can be a split, floating window,
    -- or `main` to show the preview in the main editor window.
    ---@type trouble.Window.opts
    preview = {
      type = "main",
      -- when a buffer is not yet loaded, the preview window will be created
      -- in a scratch buffer with only syntax highlighting enabled.
      -- Set to false, if you want the preview to always be a real loaded buffer.
      scratch = true,
    },
    -- Throttle/Debounce settings. Should usually not be changed.
    ---@type table<string, number|{ms:number, debounce?:boolean}>
    throttle = {
      refresh = 20, -- fetches new data when needed
      update = 10, -- updates the window
      render = 10, -- renders the window
      follow = 100, -- follows the current item
      preview = { ms = 100, debounce = true }, -- shows the preview for the current item
    },
    -- Key mappings can be set to the name of a builtin action,
    -- or you can define your own custom action.
    ---@type table<string, trouble.Action.spec|false>
    keys = {
      ["?"] = "help",
      r = "refresh",
      R = "toggle_refresh",
      q = "close",
      o = "jump_close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      ["<2-leftmouse>"] = "jump",
      ["<c-s>"] = "jump_split",
      ["<c-v>"] = "jump_vsplit",
      -- go down to next item (accepts count)
      -- j = "next",
      ["}"] = "next",
      ["]]"] = "next",
      -- go up to prev item (accepts count)
      -- k = "prev",
      ["{"] = "prev",
      ["[["] = "prev",
      dd = "delete",
      d = { action = "delete", mode = "v" },
      i = "inspect",
      p = "preview",
      P = "toggle_preview",
      zo = "fold_open",
      zO = "fold_open_recursive",
      zc = "fold_close",
      zC = "fold_close_recursive",
      za = "fold_toggle",
      zA = "fold_toggle_recursive",
      zm = "fold_more",
      zM = "fold_close_all",
      zr = "fold_reduce",
      zR = "fold_open_all",
      zx = "fold_update",
      zX = "fold_update_all",
      zn = "fold_disable",
      zN = "fold_enable",
      zi = "fold_toggle_enable",
      gb = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view:filter({ buf = 0 }, { toggle = true })
        end,
        desc = "Toggle Current Buffer Filter",
      },
      s = { -- example of a custom action that toggles the severity
        action = function(view)
          local f = view:get_filter("severity")
          local severity = ((f and f.filter.severity or 0) + 1) % 5
          view:filter({ severity = severity }, {
            id = "severity",
            template = "{hl:Title}Filter:{hl} {severity}",
            del = severity == 0,
          })
        end,
        desc = "Toggle Severity Filter",
      },
    },
    ---@type table<string, trouble.Mode>
    modes = {
      -- sources define their own modes, which you can use directly,
      -- or override like in the example below
      lsp_references = {
        -- some modes are configurable, see the source code for more details
        params = {
          include_declaration = true,
        },
      },
      -- The LSP base mode for:
      -- * lsp_definitions, lsp_references, lsp_implementations
      -- * lsp_type_definitions, lsp_declarations, lsp_command
      lsp_base = {
        params = {
          -- don't include the current location in the results
          include_current = false,
        },
      },
      -- more advanced example that extends the lsp_document_symbols
      symbols = {
        desc = "document symbols",
        mode = "lsp_document_symbols",
        focus = false,
        win = { position = "right" },
        filter = {
          -- remove Package since luals uses it for control flow structures
          ["not"] = { ft = "lua", kind = "Package" },
          any = {
            -- all symbol kinds for help / markdown files
            ft = { "help", "markdown" },
            -- default set of symbol kinds
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              "Property",
              "Struct",
              "Trait",
            },
          },
        },
      },
    },
    -- stylua: ignore
    icons = {
      ---@type trouble.Indent.symbols
      indent = {
        top           = "│ ",
        middle        = "├╴",
        last          = "└╴",
        -- last          = "-╴",
        -- last       = "╰╴", -- rounded
        fold_open     = " ",
        fold_closed   = " ",
        ws            = "  ",
      },
      folder_closed   = " ",
      folder_open     = " ",
      kinds = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = " ",
        Field         = " ",
        File          = " ",
        Function      = "󰊕 ",
        Interface     = " ",
        Key           = " ",
        Method        = "󰊕 ",
        Module        = " ",
        Namespace     = "󰦮 ",
        Null          = " ",
        Number        = "󰎠 ",
        Object        = " ",
        Operator      = " ",
        Package       = " ",
        Property      = " ",
        String        = " ",
        Struct        = "󰆼 ",
        TypeParameter = " ",
        Variable      = "󰀫 ",
      },
    },
  },
  keys = {
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle true focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)"
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},

-- dap / Debug Adapter Protocol
{
  "mfussenegger/nvim-dap",
  keys = {
    {"<leader>dc", function()
      require("dap").continue()
    end},
    {"<leader>dr", function()
      require("dap").repl.toggle()
    end},
    {"<leader>dK", function()
      require("dap.ui.widgets").hover()
    end},
    {"<leader>dT", function()
      require("dap").toggle_breakpoint()
    end},
    {"<leader>dso", function()
      require("dap").step_over()
    end},
    {"<leader>dsi", function()
      require("dap").step_into()
    end},
    {"<leader>dL", function()
      require("dap").run_last()
    end},
  },
},
{
  "nvim-neotest/nvim-nio",
},
{
  "rcarriga/nvim-dap-ui",
},

-- Linters
{
  "mfussenegger/nvim-lint",
},

-- Formatters
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
{
  "mhartington/formatter.nvim",
  config = function()
    local formatter = require("formatter")
    formatter.setup {
      -- Enable or disable logging
      -- logging = true,
      -- Set the log level
      -- log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require("formatter.filetypes.lua").stylua,
          -- You can also define your own configuration
          function()
            -- Supports conditional formatting
            if require("formatter.util").get_current_buffer_file_name() == "special.lua" then
              return nil
            end
            -- Full specification of configurations is down below and in Vim help
            -- files
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                require("formatter.util").escape_path(require("formatter.util").get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace
        },
      },
    }
  end,
},

-- Special language servers
-- {
--   "mfussenegger/nvim-jdtls",
--   config = function()
--     local jdtls_dir = os.getenv("HOME") .. "/jdtls/"
--     -- local jar = jdtls_dir .. 'plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1100.v20240722-2106.jar'
--     local jar = jdtls_dir .. 'plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'
--     local config_dir = jdtls_dir .. 'config_linux'
--     -- local root_markers = { "pom.xml",  "build.xml", ".git", "mvnw", "gradlew", "build.gradle" }
--     local root_markers = { "pom.xml" }
--     local root_dir = vim.fs.root(0, root_markers)
--     local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
--     local workspace_dir = jdtls_dir .. project_name
--     -- -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
--     -- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--     -- local workspace_dir = '~/.cache/jdtls/workspace' .. project_name
--     -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--     local config = {
--       -- The command that starts the language server
--       -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--       cmd = {
--         'jdtls',
--         -- 'java', -- or '/path/to/java17_or_newer/bin/java'
--         --         -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--         -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--         -- '-Dosgi.bundles.defaultStartLevel=4',
--         -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
--         -- '-Dlog.protocol=true',
--         -- '-Dlog.level=ALL',
--         -- '-Xmx1g',
--         -- '--add-modules=ALL-SYSTEM',
--         -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--         -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--         -- '-jar', jar,
--         --      -- Must point to the                                                     Change this to
--         --      -- eclipse.jdt.ls installation                                           the actual version
--         -- '-configuration', config_dir,
--         --                 -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--         --                 -- Must point to the                      Change to one of `linux`, `win` or `mac`
--         --                 -- eclipse.jdt.ls installation            Depending on your system.
--         -- -- See `data directory configuration` section in the README
--         -- '-data', workspace_dir,
--       },
--       -- This is the default if not provided, you can remove it. Or adjust as needed.
--       -- One dedicated LSP server & client will be started per unique root_dir
--       -- vim.fs.root requires Neovim 0.10.
--       -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--       root_dir = root_dir,
--       -- Here you can configure eclipse.jdt.ls specific settings
--       -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--       -- for a list of options
--       settings = {
--         java = {
--         }
--       },
--       -- Language server `initializationOptions`
--       -- You need to extend the `bundles` with paths to jar files
--       -- if you want to use additional eclipse.jdt.ls plugins.
--       -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--       -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--       init_options = {
--         bundles = {}
--       },
--     }
--     -- This starts a new client & server,
--     -- or attaches to an existing client & server depending on the `root_dir`.
--     require('jdtls').start_or_attach(config)
--   end,
-- },

{
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ft = { "scala", "sbt", }, -- "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings = {
      excludedPackages = { },
      showImplicitArguments = true,
      autoImportBuild = "all",
      defaultBspToBuildTool = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      inlayHints = {
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = true },
        implicitConversions = { enable = true },
        inferredTypes = { enable = true },
        typeParameters = { enable = true },
      },
    }
    -- I *highly* recommend setting statusBarProvider to either "off" or "on"
    -- "off" will enable LSP progress notifications by Metals and you'll need
    -- to ensure you have a plugin like fidget.nvim installed to handle them.
    -- "on" will enable the custom Metals status extension and you *have* to have
    -- a have settings to capture this in your statusline or else you'll not see
    -- any messages from metals. There is more info in the help docs about this
    metals_config.init_options.statusBarProvider = "off"
    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    metals_config.on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>mc", function()
        require("telescope").extensions.metals.commands()
      end, { desc = "metals commands" })
      require("metals").setup_dap()
      vim.keymap.set("n", "<leader>ws", function()
        require("metals").hover_worksheet()
      end, { desc = "metals hover worksheet" })
    end
    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
},

{
  "williamboman/mason.nvim",
},

{
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup{
      -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
      -- This setting has no relation with the `automatic_installation` setting.
      ---@type string[]
      ensure_installed = {"pyright", "jdtls", "lua_ls"},
      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
      -- This setting has no relation with the `ensure_installed` setting.
      -- Can either be:
      --   - false: Servers are not automatically installed.
      --   - true: All servers set up via lspconfig are automatically installed.
      --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
      --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
      ---@type boolean
      -- automatic_installation = false,
      automatic_installation = { exclude = { } },
      -- See `:h mason-lspconfig.setup_handlers()`
      ---@type table<string, fun(server_name: string)>?
      handlers = nil,
    }
  end,
},

-- lua_ls config for editing neovim files
{
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    runtime = vim.env.VIMRUNTIME --[[@as string]],
    ---@type lazydev.Library.spec[]
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      { path = "trouble.nvim", words = {"@type trouble"} },
    },
    integrations = {
      -- Fixes lspconfig's workspace management for LuaLS
      -- Only create a new workspace if the buffer is not part
      -- of an existing workspace or one of its libraries
      lspconfig = true,
      -- add the cmp source for completion of:
      -- `require "modname"`
      -- `---@module "modname"`
      cmp = true,
      -- same, but for Coq
      coq = false,
    },
    -- always enable unless `vim.g.lazydev_enabled = false`
    -- This is the default
    ---@type boolean|(fun(root:string):boolean?)
    -- enabled = function(root_dir)
    --   return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    -- end,
    -- disable when a .luarc.json file is found
    enabled = function(root_dir)
      return (vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled) and not vim.uv.fs_stat(root_dir .. "/.luarc.json")
      -- return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
    end,
  },
  config = function(_, opts)
    require("lazydev").setup(opts)
    -- require("cmp").setup({
    --   sources = {
    --     name = "lazydev",
    --     group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --   },
    -- })
  end,
},
{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
{
  "folke/neoconf.nvim",
  cmd = "Neoconf",
  event = "VeryLazy",
  opts = {
    -- name of the local settings files
    local_settings = ".neoconf.json",
    -- name of the global settings file in your Neovim config directory
    global_settings = "neoconf.json",
    -- import existing settings from other plugins
    import = {
      vscode = false, -- local .vscode/settings.json
      coc = false, -- global/local coc-settings.json
      nlsp = false, -- global/local nlsp-settings.nvim json settings
    },
    -- send new configuration to lsp clients when changing json settings
    live_reload = false,
    -- set the filetype to jsonc for settings files, so you can use comments
    -- make sure you have the jsonc treesitter parser installed!
    filetype_jsonc = true,
    plugins = {
      -- configures lsp clients with settings in the following order:
      -- - lua settings passed in lspconfig setup
      -- - global json settings
      -- - local json settings
      lspconfig = {
        enabled = true,
      },
      -- configures jsonls to get completion in .nvim.settings.json files
      jsonls = {
        enabled = true,
        -- only show completion in json settings for configured lsp servers
        configured_servers_only = true,
      },
      -- configures lua_ls to get completion of lspconfig server settings
      lua_ls = {
        -- by default, lua_ls annotations are only enabled in your neovim config directory
        enabled_for_neovim_config = true,
        -- explicitly enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
        enabled = false,
      },
    },
  },
},


{
  "neovim/nvim-lspconfig",
  dependencies = {'folke/neoconf.nvim'},
  config = function(_, opts)
    -- If diff-mode, don't load any LSP Configs
    if (vim.opt.diff:get()) then
      return
    end
    local lsp = require("lspconfig")
    lsp.util.default_config = vim.tbl_extend(
      "force",
      lsp.util.default_config,
      {
        -- autostart = false,
        handlers = {
          -- ["window/logMessage"] = function(err, method, params, client_id)
          --   if params and params.type <= vim.lsp.protocol.MessageType.Log then
          --     vim.lsp.handlers["window/logMessage"](err, method, params, client_id)
          --   end
          -- end,
          -- ["window/showMessage"] = function(err, method, params, client_id)
          --   if params and params.type <= vim.lsp.protocol.MessageType.Warning.Error then
          --     vim.lsp.handlers["window/showMessage"](err, method, params, client_id)
          --   end
          -- end,
        }
      }
    )

    -- lsp.pyright.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    --   single_file_support = true,
    --   root_dir = lsp.util.root_pattern('pyproject.toml',
    --     'setup.py',
    --     'setup.cfg',
    --     'requirements.txt',
    --     'Pipfile',
    --     'pyrightconfig.json',
    --     '.git'
    --   ),
    --   settings = {
    --     python = {
    --       pythonPath = require("utils.python").pyenv_path(),
    --       venvPath = require("utils.python").pyenv_root(),
    --       venv = require("utils.python").pyenv_venv(),
    --       analysis = {
    --         indexing = true,
    --         typeCheckingMode = "standard",
    --         -- diagnosticMode = "openFilesOnly",
    --         diagnosticMode = "workspace",
    --         autoSearchPaths = true,
    --         useLibraryCodeForTypes = true,
    --         autoImportCompletions = true,
    --         diagnosticSeverityOverrides = {
    --           reportAttributeAccessIssue = "warning",
    --           reportPropertyTypeMismatch = "information",
    --           reportImportCycles = "information",
    --           reportUnusedImport = "information",
    --           reportUnusedClass = "information",
    --           reportUnusedFunction = "information",
    --           reportUnusedVariable = "information",
    --           reportDuplicateImport = "information",
    --           reportAssignmentType = "information",
    --           reportIncompatibleMethodOverride = "information",
    --           reportUntypedFunctionDecorator = "information",
    --           reportUntypedClassDecorator = "information",
    --           reportUntypedBaseClass = "information",
    --           reportUntypedNamedTuple = "information",
    --           reportPrivateUsage = "information",
    --           reportTypeCommentUsage = "information",
    --           reportConstantRedefinition = "information",
    --           reportDeprecated = "information",
    --           reportMissingParameterType = "information",
    --           reportMissingTypeArgument = "information",
    --           reportUnnecessaryIsInstance = "information",
    --           reportUnnecessaryCast = "information",
    --           reportUnnecessaryComparison = "information",
    --           reportUnnecessaryContains = "information",
    --           reportImplicitStringConcatenation = "information",
    --           reportIncompleteStub = "information",
    --           reportMatchNotExhaustive = "information",
    --           reportImplicitOverride = "information",
    --           reportShadowedImports = "information",
    --         },
    --       },
    --     },
    --   },
    -- }
    lsp.basedpyright.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      single_file_support = true,
      root_dir = lsp.util.root_pattern('pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        '.git'
      ),
      settings = {
        basedpyright = {
          pythonPath = require("utils.python").pyenv_path(),
          venvPath = require("utils.python").pyenv_root(),
          venv = require("utils.python").pyenv_venv(),
          analysis = {
            indexing = true,
            typeCheckingMode = "standard",
            -- diagnosticMode = "openFilesOnly",
            diagnosticMode = "workspace",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
            inlayHints = {
              variableTypes = true,
              functionReturnTypes = true,
            },
            diagnosticSeverityOverrides = {
              reportAttributeAccessIssue = "warning",
              reportPropertyTypeMismatch = "information",
              reportImportCycles = "information",
              reportUnusedImport = "information",
              reportUnusedClass = "information",
              reportUnusedFunction = "information",
              reportUnusedVariable = "information",
              reportDuplicateImport = "information",
              reportAssignmentType = "information",
              reportIncompatibleMethodOverride = "information",
              reportUntypedFunctionDecorator = "information",
              reportUntypedClassDecorator = "information",
              reportUntypedBaseClass = "information",
              reportUntypedNamedTuple = "information",
              reportPrivateUsage = "information",
              reportTypeCommentUsage = "information",
              reportConstantRedefinition = "information",
              reportDeprecated = "information",
              reportMissingParameterType = "information",
              reportMissingTypeArgument = "information",
              reportUnnecessaryIsInstance = "information",
              reportUnnecessaryCast = "information",
              reportUnnecessaryComparison = "information",
              reportUnnecessaryContains = "information",
              reportImplicitStringConcatenation = "information",
              reportIncompleteStub = "information",
              reportMatchNotExhaustive = "information",
              reportImplicitOverride = "information",
              reportShadowedImports = "information",
              reportUnknownVariableType = "none",
            },
          },
        },
      },
    }
    lsp.jdtls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      cmd = { 'jdtls' },
      -- filetypes = { 'java' },
      filetypes = { 'java', 'xml.maven' },
      single_file_support = true,
      -- init_options = {
      --   extendedClientCapabilities = {
      --     progressReportProvider = false,
      --   },
      -- },
      handlers = {
        -- mute; having progress reports is enough
        ["language/status"] = function() end,
      },
      root_dir = function(fname)
        local root_markers = { "pom.xml",  "build.xml", "mvnw", "gradlew", "build.gradle" }
        local root_dir = vim.fs.root(0, root_markers)
        return root_dir
      end,
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            -- toString = {
            --   template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            -- },
            -- hashCodeEquals = {
            --   useJava7Objects = true,
            -- },
            -- useBlocks = true,
          },
          configuration = {
            -- runtimes = {
            --   {
            --     name = "JavaSE-17",
            --     path = "/usr/lib/jvm/java-17-openjdk/",
            --   },
            -- },
          },
        },
      },
    }
    -- lsp.metals.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    --   filetypes = { "scala", "sbt" },
    --   init_options = {
    --     compilerOptions = {
    --       snippetAutoIndent = false
    --     },
    --     isHttpEnabled = true,
    --     statusBarProvider = "show-message",
    --   },
    -- }
    lsp.vimls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.yamlls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.ts_ls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.bashls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      filetypes = { "sh", "bash", "zsh" },
    }
    lsp.cmake.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.jsonls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.dprint.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.eslint.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.jinja_lsp.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    -- lsp.ltex.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- }
    lsp.lua_ls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        Lua = {
          hint = {
            enable = true,
            arrayIndex = "Disable",
            paramName = "Literal",
          },
          diagnostics = {
            -- globals = { 'vim' },
            disable = {'missing-fields'},
          },
        },
      },
      -- on_init = function(client)
      --   -- possibly replaced by folke/lazydev.nvim
      --   -- local path = client.workspace_folders[1].name
      --   -- if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
      --   --   return
      --   -- end
      --   -- client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      --   --   runtime = {
      --   --     -- Tell the language server which version of Lua you're using
      --   --     -- (most likely LuaJIT in the case of Neovim)
      --   --     version = 'LuaJIT'
      --   --   },
      --   --   -- Make the server aware of Neovim runtime files
      --   --   workspace = {
      --   --     checkThirdParty = false,
      --   --     library = require("utils").concat(
      --   --       {
      --   --         vim.env.VIMRUNTIME,
      --   --         -- Depending on the usage, you might want to add additional paths here.
      --   --         -- "${3rd}/luv/library"
      --   --         -- "${3rd}/busted/library",
      --   --       }
      --   --       -- vim.api.nvim_get_runtime_file("**/types/**/*.lua", true),
      --   --       -- vim.api.nvim_get_runtime_file("**/types.lua", true),
      --   --       -- vim.api.nvim_get_runtime_file("**/api.lua", true),
      --   --       -- vim.api.nvim_get_runtime_file("**/**/trouble/**/*.lua", true),
      --   --     ),
      --   --     -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
      --   --     -- library = vim.api.nvim_get_runtime_file("", true)
      --   --   }
      --   -- })
      -- end,
    }
    -- lsp.grammarly.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    --   -- fix for grammarly only working on node 16 https://github.com/neovim/nvim-lspconfig/issues/2007
    --   -- cmd = { "nvm", "exec", "16", "grammarly-languageserver", "--stdio" },
    -- }
    lsp.pbls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    -- lsp.r_language_server.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- }
    lsp.rust_analyzer.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.cssls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.sqlls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    -- lsp.harper_ls.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- }
    lsp.marksman.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp.awk_ls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,
},

}
