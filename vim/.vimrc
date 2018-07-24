" Load plugins with vim-plug
call plug#begin('~/.vim/plugged')
"Plug 'chriskempson/base16-vim'
"Plug 'romainl/Apprentice'
" Plug 'scrooloose/syntastic'
Plug 'haya14busa/incsearch.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'vim-airline/vim-airline'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim'
call plug#end()

" Colors
"set background=dark
"colorscheme base16-railscasts
"colorscheme apprentice
colorscheme default

" syntax
syntax on
set number
" Turn off auto-commenting
au FileType * setlocal formatoptions-=c
au FileType * setlocal formatoptions-=r
au FileType * setlocal formatoptions-=o
filetype plugin indent on

" search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set ignorecase
set smartcase

" tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab


" aliases
:command WQ wq
:command Wq wq
:command Q q
:command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode
" clipboard
set clipboard+=unnamedplus

" set tempfile location
"silent !mkdir -p ~/.vim/tmp/backup > /dev/null 2>&1
set backupdir=~/.vim/tmp/backup//
"silent !mkdir -p ~/.vim/tmp/swap > /dev/null 2>&1
set directory=~/.vim/tmp/swap//
"silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
set undodir=~/.vim/tmp/undo//
" Persistent undo
set undofile


" Syntastic
" highlight SignColumn ctermbg=16
" highlight SyntasticStyleErrorSign ctermfg=7 ctermbg=15
" highlight SyntasticError ctermbg=7
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_html_checkers = ['eslint']
" let g:syntastic_css_checkers = ['stylelint']

" YouCompleteMe
"let g:ycm_python_binary_path = '/usr/bin/python3'

" Indent Guides
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 2
"let g:indent_guides_guides_size = 1
"hi IndentGuidesEven ctermbg=238
"hi IndentGuidesOdd ctermbg=236

" vimdiff
highlight DiffAdd    cterm=bold ctermfg=231 ctermbg=103
highlight DiffDelete cterm=bold ctermfg=231 ctermbg=103
highlight DiffChange cterm=bold ctermfg=231 ctermbg=103
highlight DiffText   cterm=bold ctermfg=231 ctermbg=131
