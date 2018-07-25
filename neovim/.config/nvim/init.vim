" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'neomake/neomake'
"Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-fugitive'
"Plug 'chriskempson/base16-vim'
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
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase
set incsearch
set gdefault 
set magic

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
set noshowmode
" clipboard
set clipboard+=unnamedplus
set mouse=a

" set tempfile location
"silent !mkdir -p ~/.vim/tmp/backup > /dev/null 2>&1
set backupdir=~/.vim/tmp/backup//
"silent !mkdir -p ~/.vim/tmp/swap > /dev/null 2>&1
set directory=~/.vim/tmp/swap//
"silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
set undodir=~/.vim/tmp/undo//
" Persistent undo
set undofile
set undolevels=5000

" Remember last cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""""""PLUGINS"""""""

" Neomake
autocmd! BufWritePost,BufEnter  * Neomake
highlight NeomakeWarningSign ctermfg=227
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
highlight NeomakeErrorSign ctermfg=196
let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
highlight SignColumn ctermbg=None

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='apprentice'
let g:airline_theme='base16'

let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
let g:airline_section_b = airline#section#create(['hunks', 'branch'])

" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" set python bin
" let g:python_host_prog = '/home/colin/miniconda3/envs/py2/bin/python'
" let g:python3_host_prog = '/home/colin/.conda/envs/py3/bin/python'
