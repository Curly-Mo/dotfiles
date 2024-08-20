-- misc plugin config. Can be moved to lua/config?
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    end
    if client.supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    end
    if client.supports_method("textDocument/references") then
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end
    if client.supports_method("textDocument/declaration") then
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    end
    if client.supports_method("textDocument/rename") then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
    if client.supports_method("textDocument/code_action") then
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, opts)
    end
  end,
})
