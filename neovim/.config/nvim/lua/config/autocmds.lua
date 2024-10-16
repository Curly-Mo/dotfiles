-- misc plugin config

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('UserLspConfig', {clear = false}),
  callback = function(args)
    local opts = require("utils").default_opts({ buffer = args.buf })
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local client = vim.lsp.get_client_by_id(args.data.client_id) or {}
    -- local capabilities = client.server_capabilities

    -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    --   vim.lsp.diagnostic.on_publish_diagnostics, {
    --     -- delay update diagnostics
    --     update_in_insert = false,
    --     diagnostic_delay = 5000,
    --     show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
    --     -- signs = true,
    --     -- underline = false,    
    --     -- virtual_text = true,
    --   }
    -- )

    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, opts())
      -- disable inlay_hints in insert mode
      -- vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
      --   group = vim.api.nvim_create_augroup('UserLspInlayConfig', {clear = false}),
      --   callback = function(inlay_args)
      --     local enabled = inlay_args.event ~= "InsertEnter"
      --     vim.lsp.inlay_hint.enable(enabled, opts())
      --   end,
      -- })
      -- toggle inlay_hints
      vim.keymap.set("n", "<leader>Q", function()
        local was_enabled = vim.lsp.inlay_hint.is_enabled()
        local enabled = not was_enabled
        vim.lsp.inlay_hint.enable(enabled, opts())
        -- make sure we don't re-enable when exiting insert mode
        -- vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
        --   group = vim.api.nvim_create_augroup('UserLspInlayConfig', {clear = true}),
        --   callback = function(_)
        --     -- if args.event == "InsertLeave" then
        --     --   vim.lsp.inlay_hint.enable(enabled, opts())
        --     -- end
        --   end,
        -- })
      end, opts({ desc = "toggle inlay hints"}))
    end
  end,
})
