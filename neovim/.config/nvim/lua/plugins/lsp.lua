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
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    -- lspconfig.jdtls.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
    lspconfig.tsserver.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.bashls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.jsonls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.ltex.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.lua_ls.setup{
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
    lspconfig.grammarly.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.perlnavigator.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.pbls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    -- lspconfig.r_language_server.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
    lspconfig.rust_analyzer.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.cssls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    lspconfig.sqlls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    -- lspconfig.harper_ls.setup{
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
    lspconfig.metals.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
  end,
},
-- Special language servers
{
  "mfussenegger/nvim-jdtls",
},
{
  "scalameta/nvim-metals",
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
        }
      }
    }
  end,
},

}
