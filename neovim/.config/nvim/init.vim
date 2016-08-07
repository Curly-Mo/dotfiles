" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'vim-airline/vim-airline'
"Plug 'chriskempson/base16-vim'
"Plug 'romainl/Apprentice'
"Plug 'scrooloose/syntastic'
"Plug 'haya14busa/incsearch.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'mattn/emmet-vim'
call plug#end()

" Colors
"set background=dark
"colorscheme base16-railscasts
"colorscheme apprentice
"colorscheme default

" syntax
syntax on
set rnu
filetype plugin indent on
"set ruler
set formatoptions-=cro "don't continue comment marks
" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set smartcase
set incsearch
set gdefault 
set magic

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab

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
set clipboard=unnamed

" set tempfile location
"silent !mkdir -p ~/.vim/tmp/backup > /dev/null 2>&1
set backupdir=~/.vim/tmp/backup//
"silent !mkdir -p ~/.vim/tmp/swap > /dev/null 2>&1
set directory=~/.vim/tmp/swap//
"silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
set undodir=~/.vim/tmp/undo//
" Persistent undo
set undofile


""""""PLUGINS"""""""

" Neomake
autocmd! BufWritePost * Neomake

" Airline
let g:airline_powerline_fonts = 1
