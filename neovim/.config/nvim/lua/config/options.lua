-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- BASICS
-- syntax
vim.opt.syntax = "on"
-- vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true

-- state tmp locations
vim.opt.backupdir=vim.fn.stdpath('state') .. "/backup/"
vim.opt.directory=vim.fn.stdpath('state') .. "/swap/"
vim.opt.undodir=vim.fn.stdpath('state') .. "/undo/"
-- Persistent undo
vim.opt.undofile = true
vim.opt.undolevels=50000

-- vimdiff
vim.opt.fillchars:append({vert = '│'})

-- search
vim.opt.hlsearch = true
vim.cmd([[ nnoremap <silent> <Space> <CMD>nohlsearch<Bar>:echo<CR> ]])
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.magic = true

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.cmd([[ autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab ]])

-- aliases
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Q', 'qa!', {})
vim.api.nvim_create_user_command('CQ', 'cq', {})
vim.api.nvim_create_user_command('Cq', 'cq', {})
vim.api.nvim_create_user_command('Bd', 'bd', {})
vim.api.nvim_create_user_command('BD', 'bd', {})
-- :command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
-- :command W :execute '!sudo tee % > /dev/null'
-- :command W w
vim.api.nvim_create_user_command('W', 'SudoWrite', {})
vim.api.nvim_create_user_command('WW', 'SudaWrite', {})
vim.api.nvim_create_user_command('Wd', 'Mkdir | w', {})
vim.api.nvim_create_user_command('WD', 'Mkdir | SudoWrite', {})
vim.api.nvim_create_user_command('WWD', 'Mkdir | SudaWrite', {})
-- reload vimrc
vim.api.nvim_create_user_command('Reload', 'source $MYVIMRC', {})
-- csv
vim.api.nvim_create_user_command('CSV', '%!column -t', {})
-- cd
vim.api.nvim_create_user_command('CD', 'cd %:h', {})
vim.api.nvim_create_user_command('Groot', 'cd `git rev-parse --show-toplevel`', {})
vim.api.nvim_create_user_command('Proot', 'Groot', {})

-- paste
vim.opt.showmode = false
-- clipboard
vim.opt.clipboard:append({'unnamedplus'})
vim.opt.mouse = 'a'

-- status
-- vim.opt.shortmess = 'a'

-- Neovim
-- Python
vim.g.python3_host_prog = "~/.pyenv/shims/python3"
vim.g.python_host_prog = "~/.pyenv/shims/python2"
-- END BASICS

vim.g.icons = { error = "✗", warn = "⚠", hint = "󰌶", info = "ⓘ", dot = "⏺" }

-- Diagnostics
vim.opt.signcolumn = "auto:1"
local signs = {
  text = {
    [vim.diagnostic.severity.ERROR] = vim.g.icons.error,
    [vim.diagnostic.severity.WARN] = vim.g.icons.warn,
    [vim.diagnostic.severity.INFO] = vim.g.icons.info,
    [vim.diagnostic.severity.HINT] = vim.g.icons.hint,
  },
  numhl = {
    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
    [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
    [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
  },
}
local diagnostic_config = {
  virtual_text = false,
  -- virtual_text = {
  --   severity = {vim.diagnostic.severity.ERROR},
  --   source = "if_many",
  --   spacing = 2,
  --   prefix = function(diagnostic, i, total)
  --     return signs.text[diagnostic.severity]
  --   end,
  -- },
  underline = {severity = {vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN}},
  update_in_insert = false,
  severity_sort = true,
  -- float = false,
  float = {
    -- border = 'rounded',
    severity_sort = true,
    source = "if_many",
  },
  signs = signs,
}
vim.diagnostic.config(diagnostic_config)
-- Show line diagnostics automatically in hover window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 1000 -- default 4000
-- only hover float for non-errors (errors are handled by tiny-inline-diagnostic.nvim
local cursor_severity_filter = {vim.diagnostic.severity.WARN}
local line_severity_filter = {vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT}
-- show only diagnostic of word under cursor
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor", severity = cursor_severity_filter})
  end
})
-- show all diagnostics on line
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, severity = line_severity_filter})
  end
})


-- LEGACY CONFIGS
vim.cmd([[
" Turn off auto-commenting
autocmd FileType * setlocal formatoptions-=c
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o
filetype plugin indent on
"set ruler
set formatoptions-=cro "don't continue comment marks
" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nonu
    set nornu
  else
    set nu
    set rnu
  endif
endfunc

" Colors
if exists('+termguicolors')
  set termguicolors
endif
set cursorline
" vimdiff
" highlight DiffAdd    cterm=bold ctermbg=darkgrey
" highlight DiffDelete cterm=bold ctermbg=darkyellow
" highlight DiffChange cterm=bold ctermbg=darkcyan
" highlight DiffText   cterm=bold ctermbg=darkblue ctermfg=darkgrey
" " fold colors
" " set fillchars=fold:\
" highlight Folded ctermbg=235
" highlight FoldColumn ctermbg=black
" " vertical divider colors
" hi VertSplit ctermfg=Black ctermbg=248
" hi StatusLine ctermfg=236 ctermbg=248
" hi StatusLineNC ctermfg=236 ctermbg=248
" print Syntax Highlight Group of what is under cursor
function! s:syntax_query()
  let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
  return s
endfunc
command! SynID call s:syntax_query()

" Split navigation
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-S-LEFT> <C-W><C-H>
nnoremap <C-S-RIGHT> <C-W><C-L>
nnoremap <C-S-UP> <C-W><C-K>
nnoremap <C-S-DOWN> <C-W><C-J>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP
]])
-- END LEGACY CONFIGS

-- diffmode

-- vimdiff settings
vim.opt.diffopt:append({'vertical'})
vim.opt.diffopt:append({foldcolumn = 1})
vim.opt.diffopt:append({'internal', algorithm = 'patience'})

-- keep cursor centered
-- vim.opt.scrolloff = 999
-- keep cursor centered without setting scrolloff larger than needed
vim.cmd([[
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
    \ let &scrolloff=winheight(win_getid())/2
augroup END

" ignore scrolloff for mouse clicks
function! DisableScrollOff() abort
  " Save the current scrolloff
  let w:current_scrolloff = get(w:, 'current_scrolloff', &scrolloff) 
  " Disable scrolloff
  setlocal scrolloff=0
endfunction
function MouseScrollOffAutocommand() abort
  let w:current_line = line('.')
  " Set up an autocommand to reenable scrolloff
  augroup mouse_scrolloff
    autocmd!
    autocmd CursorMoved * call ReenableScrollOff()
  augroup END
endfunction
function ReenableScrollOff() abort
  if ShouldReenable()
    let &l:scrolloff = w:current_scrolloff
  endif
endfunction
function ShouldReenable() abort
  return exists('w:current_scrolloff') &&
    \ winline() > w:current_scrolloff &&
    \ winline() <= winheight(0) - w:current_scrolloff
  return line('.') != w:current_line
endfunction
nnoremap <silent> <LeftMouse> <CMD>call DisableScrollOff()<CR><LeftMouse><CMD>call MouseScrollOffAutocommand()<CR>
]])

-- completion options
-- vim.opt_global.completeopt = { "menu", "menuone", "noinsert", "noselect", "preview", "popup" }
