" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
" Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim', 'as': 'apprentice-airline' }
" Plug 'artur-shaik/vim-javacomplete2'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
"Plug 'chriskempson/base16-vim'
Plug 'haya14busa/incsearch.vim'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" maktaba and glaive needed by codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'sbdchd/neoformat'
Plug 'ensime/ensime-vim', { 'do': 'UpdateRemotePlugins', 'for': ['scala', 'java'] }
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
" Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'universal-ctags/ctags'
Plug 'derekwyatt/vim-scala'
Plug 'tweekmonster/impsort.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lervag/vimtex'
Plug 'NLKNguyen/vim-maven-syntax'
Plug 'mechatroner/rainbow_csv'
Plug 'plytophogy/vim-diffchanges'
" Plug 'editorconfig/editorconfig-vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'ambv/black'
Plug 'embear/vim-localvimrc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" Colors
"set background=dark
colorscheme default
"colorscheme base16-railscasts
" silent! colorscheme apprentice
set t_Co=256
" set termguicolors

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
    set nonu
    set nornu
  else
    set nu
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
set undolevels=50000

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

" git
set diffopt+=vertical

" status
set shortmess=a

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
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <S-L> <Plug>(ale_fix)
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%s [%linter%] %severity%'
highlight ALEErrorSign ctermfg=196
highlight ALEWarningSign ctermbg=None ctermfg=227
let g:ale_linters = {
\   'python': ['flake8', 'pyflakes', 'mypy'],
\   'java': ['checkstyle'],
\   'jsx': ['stylelint', 'eslint'],
\}
let g:ale_python_flake8_options = "--max-line-length=120"
let g:ale_fixers = {
\   'python': ['yapf'],
\   'java': ['google_java_format', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_python_yapf_options = "--style='{based_on_style: google, column_limit: 120, split_arguments_when_comma_terminated: true}'"
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_linter_aliases = {'jsx': 'css'}

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='simple'
let g:airline_theme='apprentice'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buf_min_count = 2
" let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
" let g:airline_section_b = airline#section#create(['hunks'])

"" Deoplete
"let g:deoplete#enable_at_startup = 1
""set completeopt-=preview
""" set python bin
"""let g:python_host_prog = '/home/colin/miniconda3/envs/py2/bin/python'
"""let g:python3_host_prog = '/home/colin/miniconda3/envs/py3/bin/python'
"""let g:python_host_prog = '/usr/local/bin/python'
"""let g:python_host_prog = '/Users/colinfahy/anaconda3/bin/python3'
""let g:python_host_prog = '/Users/colinfahy/anaconda3/envs/py2/bin/python'
""let g:python3_host_prog = '/Users/colinfahy/anaconda3/envs/py3/bin/python'
""let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python'
""autocmd VimEnter * inoremap <silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
""inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<CR>" : "\<CR>"
"let g:deoplete#omni#input_patterns = {}
""let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" nvim Completion Manager
" let g:cm_smart_enable=0
" imap <C-Tab> let g:cm_smart_enable=0<CR>
" autocmd VimEnter * inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" set shortmess+=c
" " Forward deoplete to NCM
" " register as ncm source
" au User CmSetup call cm#register_source({'name' : 'deoplete',
"         \ 'priority': 7,
"         \ 'abbreviation': '',
"         \ })
" " hack deoplete's mapping
" inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>
" func! g:Deoplete_ncm()
"   " forward to ncm
"   call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
"   return ''
" endfunc

" Java
" let g:JavaComplete_JavaCompiler="/usr/bin/javac"
" let g:JavaComplete_StaticImportsAtTop = 1
" let g:JavaComplete_ClasspathGenerationOrder = ['Maven', 'Eclipse', 'Gradle']
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" nmap <localleader>4 <Plug>(JavaComplete-Imports-AddSmart)
" imap <localleader>4 <Plug>(JavaComplete-Imports-AddSmart)
" nmap <localleader>5 <Plug>(JavaComplete-Imports-Add)
" imap <localleader>5 <Plug>(JavaComplete-Imports-Add)
" nmap <localleader>6 <Plug>(JavaComplete-Imports-AddMissing)
" imap <localleader>6 <Plug>(JavaComplete-Imports-AddMissing)
" nmap <localleader>7 <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <localleader>7 <Plug>(JavaComplete-Imports-RemoveUnused)

" Scala
let g:scala_scaladoc_indent = 1
let g:scala_sort_across_groups = 1
au FileType scala nnoremap <localleader>8 :SortScalaImports<CR>
" Ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
" autocmd BufWritePost *java silent :EnTypeCheck
au FileType scala,java nnoremap <localleader>dt :EnType<CR>
au FileType scala,java nnoremap <localleader>ds :EnTypeCheck<CR>
au FileType scala,java nnoremap <localleader>df :EnDeclarationSplit v<CR>
au FileType scala,java nnoremap <localleader>dd :EnDocBrowse<CR>
au FileType scala,java nnoremap <localleader>0 :EnSuggestImport<CR>
au FileType scala,java nnoremap <localleader>o :EnOrganizeImports<CR>

" Tagbar
map <C-l> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_compact = 0
let g:tagbar_indent = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_singleclick = 1
let g:tagbar_sort = 0
highlight TagbarHighlight ctermfg=051
" start open
" autocmd FileType python,java,scala call OpenTagbar()
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
let NERDTreeMapOpenInTab='\r'

"netrw Plugin-free file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 18

" Neoformat
" noremap <localleader>ll :Neoformat<CR>
let g:neoformat_enabled_java = ['uncrustify', 'clang_format', 'google']
let g:neoformat_java_clang_format = {
            \ 'exe': '/usr/local/bin/clang-format',
            \ 'args': ["--style='/Users/colinfahy/.clang-format'"],
            \ 'stdin': 1,
            \ }
let g:neoformat_java_google = {
            \ 'exe': '/usr/local/bin/google-java-format',
            \ 'args': ['-'],
            \ 'stdin': 1,
            \ }
let g:neoformat_java_uncrustify = {
            \ 'exe': '/usr/local/bin/uncrustify',
            \ 'args': ['-q', '-l JAVA', '-c /Users/colinfahy/.uncrustify'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_scala = ['scalafmt']
let g:neoformat_scala_scalafmt = {
            \ 'exe': 'scalafmt',
            \ 'args': ['--stdin 2>/dev/null --config-str "maxColumn=100"'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_python = ['yapf', 'autopep8']
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['--max-line-length 120'],
            \ }
let g:neoformat_python_yapf = {
            \ 'exe': 'yapf',
            \ 'args': ["--style='{based_on_style: google, column_limit: 120, split_arguments_when_comma_terminated: true}'"],
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

" pymode
"let g:pymode_rope_autoimport=1

" codefmt
nnoremap <localleader>ll :FormatCode<CR>
vnoremap <localleader>ll :FormatLines<CR>
au FileType python nnoremap <localleader>ll :FormatCode yapf<CR>
au FileType python vnoremap <localleader>ll :FormatLines yapf<CR>
au FileType java nnoremap <localleader>ll :FormatCode clang-format<CR>
au FileType java vnoremap <localleader>ll :FormatLines clang-format<CR>
au FileType python nnoremap <localleader>ll :FormatCode yapf<CR>
au FileType python vnoremap <localleader>ll :FormatLines yapf<CR>
" Glaive
call glaive#Install()
" Glaive codefmt clang_format_style='{BasedOnStyle: Google, ColumnLimit: 100, BinPackParameters: true, AllowAllParametersOfDeclarationOnNextLine: false, ExperimentalAutoDetectBinPacking: true, AlignAfterOpenBracket: Align}'

" rainbow csv
nnoremap <localleader>csv :RainbowDelim<CR>

" csv
:command CSV %!column -t

" vimdiff
highlight DiffAdd    cterm=bold ctermbg=103
highlight DiffDelete cterm=bold ctermbg=103
highlight DiffChange cterm=bold ctermbg=103
highlight DiffText   cterm=bold ctermbg=131

" black
let g:black_skip_string_normalization = 1
let g:black_line_length = 120

" localvimrc
let g:localvimrc_whitelist='/Users/colinfahy/workspace/.*'

" gitgutter
set updatetime=1000

" vim-lsp config
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'text': '!!'}
highlight LspErrorText ctermfg=196
highlight LspWarningText ctermbg=None ctermfg=227
" vim-lsp (language servers)
" if executable('pyls')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'pyls',
"     \ 'cmd': {server_info->['pyls']},
"     \ 'whitelist': ['python'],
"     \ })
" endif
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
    \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
    \ })
endif
if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'css-languageserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
    \ 'whitelist': ['css', 'less', 'sass'],
    \ })
endif
if executable('java')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'vscode-javac',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -jar /Users/colinfahy/packages/vscode-javac/out/fat-jar.jar']},
    \ 'whitelist': ['java'],
    \ })
endif
if executable('scalameta_lsp')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'scalameta',
    \ 'cmd': {server_info->['scalameta_lsp']},
    \ 'whitelist': ['scala'],
    \ })
endif

" asyncomplete
let g:asyncomplete_remove_duplicates = 1
set completeopt-=preview " no preview window
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif " autoclose preview window
" tabcompletion
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" load on tab only
" let g:asyncomplete_auto_popup = 0
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
