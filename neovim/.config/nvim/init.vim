" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
" Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim', 'as': 'apprentice-airline' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
"Plug 'chriskempson/base16-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" maktaba and glaive needed by codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'sbdchd/neoformat'
Plug 'ensime/ensime-vim', { 'do': 'UpdateRemotePlugins' }
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'universal-ctags/ctags'
Plug 'derekwyatt/vim-scala'
call plug#end()

" Colors
"set background=dark
"colorscheme base16-railscasts
"silent! colorscheme apprentice
colorscheme default
set t_Co=256

" syntax
syntax on
set relativenumber
set number
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
"set gdefault
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
":command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
:command W w

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

" Split navigation
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-S-LEFT> <C-W><C-H>
nnoremap <C-S-RIGHT> <C-W><C-L>
nnoremap <C-S-UP> <C-W><C-K>
nnoremap <C-S-DOWN> <C-W><C-J>

""""""PLUGINS"""""""

" " Neomake
" call neomake#configure#automake('nw', 750)
" highlight NeomakeWarningSign ctermfg=227
" let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
" highlight NeomakeErrorSign ctermfg=196
" let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
" highlight SignColumn ctermbg=None
" highlight NeomakeWarning ctermbg=None ctermfg=227
" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_yaml_enabled_makers = ['yamllint']

" Ale
let g:ale_completion_enabled = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%s [%linter%] %severity%'
highlight ALEErrorSign ctermfg=196
highlight ALEWarningSign ctermbg=None ctermfg=227
let g:ale_linters = {
\   'python': ['flake8', 'pyflakes'],
\}

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='simple'
let g:airline_theme='apprentice'

let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
let g:airline_section_b = airline#section#create(['hunks', 'branch'])

"" Deoplete
let g:deoplete#enable_at_startup = 1
"set completeopt-=preview
"" set python bin
""let g:python_host_prog = '/home/colin/miniconda3/envs/py2/bin/python'
""let g:python3_host_prog = '/home/colin/miniconda3/envs/py3/bin/python'
""let g:python_host_prog = '/usr/local/bin/python'
""let g:python_host_prog = '/Users/colinfahy/anaconda3/bin/python3'
"let g:python_host_prog = '/Users/colinfahy/anaconda3/envs/py2/bin/python'
"let g:python3_host_prog = '/Users/colinfahy/anaconda3/envs/py3/bin/python'
"let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python'
"autocmd VimEnter * inoremap <silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
"inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"

" nvim Completion Manager
autocmd VimEnter * inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c
" Forward deoplete to NCM
" register as ncm source
au User CmSetup call cm#register_source({'name' : 'deoplete',
        \ 'priority': 7,  
        \ 'abbreviation': '', 
        \ })
" hack deoplete's mapping
inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>
func! g:Deoplete_ncm()
  " forward to ncm
  call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
  return ''
endfunc

" Java
let g:JavaComplete_JavaCompiler="/usr/bin/javac"
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Scala
let g:scala_scaladoc_indent = 1
let g:scala_sort_across_groups = 1
au FileType scala nnoremap <localleader>8 :SortScalaImports<CR>
" Ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <localleader>dt :EnType<CR>
au FileType scala nnoremap <localleader>df :EnDeclarationSplit v<CR>
au FileType scala nnoremap <localleader>dd :EnDocBrowse<CR>
au FileType scala nnoremap <localleader>0 :EnSuggestImport<CR>

" Tagbar
map <C-l> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_compact = 0
let g:tagbar_indent = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_singleclick = 1
highlight TagbarHighlight ctermfg=051
autocmd FileType python,java,scala call OpenTagbar()
function! OpenTagbar()
  call tagbar#autoopen(0)
endfunction

"NerdTree
nmap <C-h> :NERDTreeToggle<CR>
"Close if all files closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Open if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"netrw Plugin-free file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 18

" Neoformat
nnoremap <localleader>ll :Neoformat<CR>
"let g:neoformat_enabled_java = ['google']
"let g:neoformat_java_google = {
"            \ 'exe': 'java',
"            \ 'args': ['-jar /usr/local/bin/google-java-format -'],
"            \ 'stdin': 1, 
"            \ }
let g:neoformat_enabled_scala = ['scalafmt']
let g:neoformat_scala_scalafmt = {
            \ 'exe': 'scalafmt',
            \ 'args': ['--stdin 2>/dev/null'],
            \ 'stdin': 1, 
            \ }

" Rainbow Parens
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\ 'operators': '_,_',
\ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\ 'separately': {
\   '*': {},
\   'tex': {
\     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\   },
\   'lisp': {
\     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\   },
\   'vim': {
\     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\   },
\   'html': {
\     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\   },
\   'css': 0,
\ }
\}

" Indent-guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=235

" IncSearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
highlight IncSearch ctermfg=cyan term=underline

" CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>')

" ctags
nnoremap <C-]> :execute "ptag " . expand("<cword>")<CR>
