-- vim.diagnostic keybinds
vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float(nil, {focus=false}) end)
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ severity = {vim.diagnostic.severity.ERROR} }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ severity = {vim.diagnostic.severity.ERROR} }) end)
vim.keymap.set('n', '[D', function() vim.diagnostic.goto_prev({ severity = {vim.diagnostic.severity.WARN, vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT} }) end)
vim.keymap.set('n', ']D', function() vim.diagnostic.goto_next({ severity = {vim.diagnostic.severity.WARN, vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT} }) end)
-- vim.keymap.set('n', '[c', function() vim.diagnostic.goto_prev({ severity = {vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT} }) end)
vim.keymap.set('n', ']c', function() vim.diagnostic.goto_next({ severity = {vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT} }) end)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
-- all workspace diagnostics
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)
-- all workspace errors
vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
end)
-- all workspace warnings
vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
end)

-- lsp keybinds
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>F', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
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
    vim.keymap.set('n', 'gk', PeekDefinition, opts)
  end,
})
