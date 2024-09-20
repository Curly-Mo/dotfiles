return {

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

{
  "neovim/nvim-lspconfig",
  config = function()
    local lsp = require("lspconfig")
    lsp.pyright.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.jdtls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      cmd = { 'jdtls' },
    }
    lsp.ts_ls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.bashls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.jsonls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.ltex.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.lua_ls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {
          -- diagnostics = {
          --   globals = { 'vim' },
          -- },
        },
      },
    }
    lsp.grammarly.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.perlnavigator.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.pbls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    -- lsp.r_language_server.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
    lsp.rust_analyzer.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.cssls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lsp.sqlls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    -- lsp.harper_ls.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
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
  },
  ft = { "scala", "sbt", }, -- "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = { },
    }
    -- I *highly* recommend setting statusBarProvider to either "off" or "on"
    -- "off" will enable LSP progress notifications by Metals and you'll need
    -- to ensure you have a plugin like fidget.nvim installed to handle them.
    -- "on" will enable the custom Metals status extension and you *have* to have
    -- a have settings to capture this in your statusline or else you'll not see
    -- any messages from metals. There is more info in the help docs about this
    metals_config.init_options.statusBarProvider = "on"
    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
      -- LSP mappings
      vim.keymap.set("n", "gD", vim.lsp.buf.definition)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
      vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
      vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>ws", function()
        require("metals").hover_worksheet()
      end)
      -- all workspace diagnostics
      vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)
      -- all workspace errors
      vim.keymap.set("n", "<leader>ae", function()
        vim.diagnostic.setqflist({ severity = "E" })
      end)
      -- all workspace warnings
      vim.keymap.set("n", "<leader>aw", function()
        vim.diagnostic.setqflist({ severity = "W" })
      end)
      -- buffer diagnostics only
      vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)
      vim.keymap.set("n", "[c", function()
        vim.diagnostic.goto_prev({ wrap = false })
      end)
      vim.keymap.set("n", "]c", function()
        vim.diagnostic.goto_next({ wrap = false })
      end)
      -- Example vim.keymap.setpings for usage with nvim-dap. If you don't use that, you can
      -- skip these
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.toggle()
      end)
      vim.keymap.set("n", "<leader>dK", function()
        require("dap.ui.widgets").hover()
      end)
      vim.keymap.set("n", "<leader>dt", function()
        require("dap").toggle_breakpoint()
      end)
      vim.keymap.set("n", "<leader>dso", function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", "<leader>dsi", function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end)
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
  end
},

-- dap / Debug Adapter Protocol
{
  "mfussenegger/nvim-dap",
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

}
