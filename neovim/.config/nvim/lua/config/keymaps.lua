-- vim.diagnostic keybinds
vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float(nil, {focus=false}) end)
vim.keymap.set('n', '[D', function() vim.diagnostic.goto_prev({ severity = {min = vim.diagnostic.severity.ERROR} }) end, { desc = "previous error" })
vim.keymap.set('n', ']D', function() vim.diagnostic.goto_next({ severity = {min = vim.diagnostic.severity.ERROR} }) end, { desc = "next error" })
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ severity = {min = vim.diagnostic.severity.HINT} }) end, { desc = "previous diagnostic" })
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ severity = {min = vim.diagnostic.severity.HINT} }) end, { desc = "next diagnostic" })
vim.keymap.set('n', '[c', function() vim.diagnostic.goto_prev({ severity = {min = vim.diagnostic.severity.WARN} }) end, { desc = "previous warning" })
vim.keymap.set('n', ']c', function() vim.diagnostic.goto_next({ severity = {min = vim.diagnostic.severity.WARN} }) end, { desc = "next warning" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "setloclist" })
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist, { desc = "all workspace diagnostics" })
vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "all workspace errors" })
vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
end, { desc = "all workspace warnings" })

-- lsp keybinds
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspKeybinds', {clear = false}),
  callback = function(args)
    local opts = require("utils").default_opts({ buffer = args.buf })
    local client = vim.lsp.get_client_by_id(args.data.client_id) or {}
    -- local capabilities = client.server_capabilities
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    if client.supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts({ desc = "lsp goto implementation" }))
    end
    if client.supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts({ desc = "lsp goto definition" }))
    end
    if client.supports_method("textDocument/declaration") then
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts({ desc = "lsp goto declaration" }))
    end
    if client.supports_method("textDocument/references") then
      vim.keymap.set("n", "gwr", vim.lsp.buf.references, opts({ desc = "lsp goto references" }))
    end
    if client.supports_method("textDocument/rename") then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts({ desc = "lsp" }))
    end
    if client.supports_method("textDocument/code_action") then
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts({ desc = "lsp code action" }))
    end
    -- TODO: put these under contidional supports_method blocks
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts({ desc = "lsp hover" }))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts({ desc = "lsp signature help" }))
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts({ desc = "lsp signature help" }))
    vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, opts({ desc = "lsp document symbol" }))
    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts({ desc = "lsp workspace symbol" }))
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts({ desc = "lsp type definition" }))
    vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts({ desc = "lsp codelens run" }))
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts({ desc = "lsp code action" }))
    vim.keymap.set('n', '<leader>F', function()
      vim.lsp.buf.format({ async = true })
    end, opts({ desc = "lsp Format" }))
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts({ desc = "lsp add workspace folder" }))
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts({ desc = "lsp remove workspace folder" }))
    -- vim.keymap.set('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts({ desc = "lsp list workspace folders" }))
    -- conditional keybinds based on server_capabilities, still not sure if there is a reason to use this over supports_method
    -- if capabilities ~= nil and capabilities.renameProvider then
    --   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts({ desc = "lsp rename" }))
    -- end
    -- custom lsp stuffs
    local function preview_location_callback(_, result)
      if result == nil or vim.tbl_isempty(result) then
        return nil
      end
      vim.lsp.util.preview_location(result[1], {})
    end
    function PeekDefinition()
      local params = vim.lsp.util.make_position_params()
      return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
    end
    vim.keymap.set('n', 'gk', PeekDefinition, opts({ desc = "lsp peek definition" }))
  end,
})

-- TODO: convert to lua
vim.cmd([[
  nnoremap <expr> 0 (col('.') == 1) ? '^' : (col('.') == match(getline('.'),'\S')+1) ? '$' : '0'
  nnoremap <expr> <M-0> '$'
]])
