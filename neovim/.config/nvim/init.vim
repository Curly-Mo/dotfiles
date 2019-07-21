" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
" Disable plugins in vimdiff
if !&diff
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " find more coc plugins here: https://www.npmjs.com/search?q=keywords%3Acoc.nvim
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
" end coc.nvim plugins
endif
" These plugins are allowed in vimdiff mode
" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-vinegar'
" end tpope
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim', 'as': 'apprentice-airline' }
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
" Plug 'sbdchd/neoformat'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
" Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'universal-ctags/ctags'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'tweekmonster/impsort.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'NLKNguyen/vim-maven-syntax'
Plug 'mechatroner/rainbow_csv'
Plug 'plytophogy/vim-diffchanges'
Plug 'raimon49/requirements.txt.vim'
Plug 'ambv/black', { 'for': ['python'], 'on': ['Black'] }
Plug 'embear/vim-localvimrc'
Plug 'junegunn/fzf'
Plug 'unblevable/quick-scope'
Plug 'natebosch/vim-lsc'
Plug 'andymass/vim-matchup'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
call plug#end()

" Colors
" set t_Co=16
" if exists('+termguicolors')
"   set termguicolors
" endif
" set notermguicolors
colorscheme default
" colorscheme base16-railscasts
" silent! colorscheme apprentice
" set background=dark
set background=light
" vimdiff
highlight DiffAdd    cterm=bold ctermbg=darkgrey
highlight DiffDelete cterm=bold ctermbg=darkyellow
highlight DiffChange cterm=bold ctermbg=darkcyan
highlight DiffText   cterm=bold ctermbg=darkcyan ctermfg=blue

" syntax
syntax on
" set relativenumber
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
" set shortmess=a

""""""PLUGINS"""""""

if !&diff
"""Plugins disable in vimdiff mode"""

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" 
" set cmdheight=2
set nobackup
set nowritebackup
" change buffers with unsaved changes
set hidden
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-LeftMouse> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText ctermbg=236
hi CocFloating ctermbg=238
hi Pmenu ctermbg=248
hi PmenuSbar ctermbg=248
hi PmenuThumb ctermbg=darkgrey
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)
" Support jsonc syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" organize imports with command and hotkey
command! -nargs=0 Org :call CocAction('runCommand', 'editor.action.organizeImport')
nmap <leader>o :Org<CR>


endif

"""Plugins allowed in vimdiff mode"""

" " Ale
" " disable completion to work with coc.vim
" let g:ale_completion_enabled = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_save = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <S-L> <Plug>(ale_fix)
" let g:ale_echo_msg_error_str = '✖'
" let g:ale_echo_msg_warning_str = '⚠'
" let g:ale_echo_msg_format = '%s [%linter%] %severity%'
" highlight ALEErrorSign ctermfg=196
" highlight ALEWarningSign ctermbg=None ctermfg=227
" highlight ALEWarning ctermbg=Black
" let g:ale_linters = {
" \   'python': ['flake8', 'pyflakes', 'pyls'],
" \   'java': ['checkstyle'],
" \   'jsx': ['stylelint', 'eslint'],
" \   'proto': ['prototool-lint'],
" \}
" let g:ale_fixers = {
" \   'python': ['black'],
" \   'java': ['google_java_format', 'remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier', 'eslint'],
" \   'scala': ['scalafmt'],
" \}
" augroup FiletypeGroup
"   autocmd!
"   au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END
" let g:ale_linter_aliases = {'jsx': 'css'}
" nnoremap <silent> gk :ALEHover<CR>
" nnoremap <silent> gd :ALEGoToDefinition<CR>
" nnoremap <silent> gr :ALEFindReferences<CR>
" nnoremap <silent> gs :ALESymbolSearch<CR>
" " let g:ale_python_flake8_options = "--max-line-length=120"

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='simple'
let g:airline_theme='apprentice'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buf_min_count = 2
" let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#formatter = 'short_path'
" let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
" let g:airline_section_b = airline#section#create(['hunks'])
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Scala
let g:scala_scaladoc_indent = 1
let g:scala_sort_across_groups = 1
let g:scala_first_party_namespaces = '\(com.spotify\)'
au FileType scala nnoremap <localleader>8 :SortScalaImports<CR>
" Ensime
" autocmd BufWritePost *.scala silent :EnTypeCheck
" au FileType scala,java nnoremap <localleader>dt :EnType<CR>
" au FileType scala,java nnoremap <localleader>ds :EnTypeCheck<CR>
" au FileType scala,java nnoremap <localleader>df :EnDeclarationSplit v<CR>
" au FileType scala,java nnoremap <localleader>dd :EnDocBrowse<CR>
" au FileType scala,java nnoremap <localleader>0 :EnSuggestImport<CR>
" au FileType scala,java nnoremap <localleader>o :EnOrganizeImports<CR>

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
"nmap <C-h> :NERDTreeToggle<CR>
""Close if all files closed
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""Open if no files specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeQuitOnOpen = 1

"netrw Plugin-free file browser
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 18

" Neoformat
" noremap <localleader>ll :Neoformat<CR>
" let g:neoformat_enabled_java = ['uncrustify', 'clang_format', 'google']
" let g:neoformat_java_clang_format = {
"             \ 'exe': '/usr/local/bin/clang-format',
"             \ 'args': ["--style='/Users/colinfahy/.clang-format'"],
"             \ 'stdin': 1,
"             \ }
" let g:neoformat_java_google = {
"             \ 'exe': '/usr/local/bin/google-java-format',
"             \ 'args': ['-'],
"             \ 'stdin': 1,
"             \ }
" let g:neoformat_java_uncrustify = {
"             \ 'exe': '/usr/local/bin/uncrustify',
"             \ 'args': ['-q', '-l JAVA', '-c /Users/colinfahy/.uncrustify'],
"             \ 'stdin': 1,
"             \ }
" let g:neoformat_enabled_scala = ['scalafmt']
" let g:neoformat_scala_scalafmt = {
"             \ 'exe': 'scalafmt',
"             \ 'args': ['--stdin 2>/dev/null --config-str "maxColumn=100"'],
"             \ 'stdin': 1,
"             \ }
" let g:neoformat_enabled_python = ['yapf', 'autopep8']
" let g:neoformat_python_autopep8 = {
"             \ 'exe': 'autopep8',
"             \ 'args': ['--max-line-length 120'],
"             \ }
" let g:neoformat_python_yapf = {
"             \ 'exe': 'yapf',
"             \ 'args': ["--style='{based_on_style: google, column_limit: 120, split_arguments_when_comma_terminated: true}'"],
"             \ }

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
" nnoremap <C-]> :execute 'ptag ' . expand('<cword>')<CR>

" pymode
"let g:pymode_rope_autoimport=1

" codefmt
" nnoremap <localleader>ll :FormatCode<CR>
" vnoremap <localleader>ll :FormatLines<CR>
" au FileType python nnoremap <localleader>ll :FormatCode yapf<CR>
" au FileType python vnoremap <localleader>ll :FormatLines yapf<CR>
" au FileType java nnoremap <localleader>ll :FormatCode clang-format<CR>
" au FileType java vnoremap <localleader>ll :FormatLines clang-format<CR>
" au FileType python nnoremap <localleader>ll :FormatCode yapf<CR>
" au FileType python vnoremap <localleader>ll :FormatLines yapf<CR>
" " Glaive
" call glaive#Install()
" Glaive codefmt clang_format_style='{BasedOnStyle: Google, ColumnLimit: 100, BinPackParameters: true, AllowAllParametersOfDeclarationOnNextLine: false, ExperimentalAutoDetectBinPacking: true, AlignAfterOpenBracket: Align}'

" rainbow csv
nnoremap <localleader>csv :RainbowDelim<CR>

" csv
:command CSV %!column -t

" black
let g:black_skip_string_normalization = 1
let g:black_linelength = 120

" localvimrc
let g:localvimrc_whitelist='/Users/colinfahy/workspace/.*'

" gitgutter
set updatetime=1000
highlight GitGutterAdd ctermfg=2 ctermbg=none
highlight GitGutterChange ctermbg=none
highlight GitGutterDelete ctermfg=1

" vim-lsp config
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '⚠'}
" let g:lsp_signs_hint = {'text': '!!'}
" highlight LspErrorText ctermfg=196
" highlight LspWarningText ctermbg=None ctermfg=227
" " vim-lsp (language servers)
" " if executable('pyls')
" "   au User lsp_setup call lsp#register_server({
" "     \ 'name': 'pyls',
" "     \ 'cmd': {server_info->['pyls']},
" "     \ 'whitelist': ['python'],
" "     \ })
" " endif
" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'typescript-language-server',
"     \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"     \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"     \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
"     \ })
" endif
" if executable('css-languageserver')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'css-languageserver',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
"     \ 'whitelist': ['css', 'less', 'sass'],
"     \ })
" endif
" if executable('java')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'vscode-javac',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -jar /Users/colinfahy/packages/vscode-javac/out/fat-jar.jar']},
"     \ 'whitelist': ['java'],
"     \ })
" endif
" if executable('scalameta_lsp')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'scalameta',
"     \ 'cmd': {server_info->['scalameta_lsp']},
"     \ 'whitelist': ['scala'],
"     \ })
" endif

" asyncomplete
" let g:asyncomplete_remove_duplicates = 1
" set completeopt-=preview " no preview window
" " autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif " autoclose preview window
" " tabcompletion
" inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
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

" LanguageClient-neovim
" let g:LanguageClient_serverCommands = {
"     \ 'java': ['/usr/local/bin/jdtls'],
"     \ }
"     " \ 'scala': ['coursier', "launch", '-r', 'bintray:scalameta/maven', 'org.scalameta:metals_2.12:0.3.1', '-M', 'scala.meta.metals.Main'],
"     " \ 'scala': ['scalameta_lsp'],
"     " \ 'scala': ['metals-vim'],
" let g:LanguageClient_changeThrottle = 2.0
" let g:LanguageClient_diagnosticsEnable = 0
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " nnoremap <silent> gk :call LanguageClient#textDocument_hover()<CR>
" " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" " nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
" autocmd FileType java nnoremap <buffer> <silent> gk :call LanguageClient#textDocument_hover()<CR>
" autocmd FileType java nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
" autocmd FileType java nnoremap <buffer> <silent> gr :call LanguageClient#textDocument_rename()<CR>

" ncm2
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" which-key
" nnoremap <silent> <leader> :WhichKey '\'<CR>
" set timeoutlen=1000

" fugitive
let g:github_enterprise_urls = ['https://ghe.spotify.net']

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=300

" vim-lsc
" let g:lsc_enable_autocomplete = v:false
" let g:lsc_server_commands = {
"     \ 'scala': 'metals-test.sh'
"     \ }
" let g:lsc_auto_map = {
"     \ 'GoToDefinition': 'gd',
"     \}

" Smoother scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" MacOS clipboard, slow startup time searching for clipboard provider if not set
if has('macunix')
  let g:clipboard = {
    \ 'name': 'pbcopy',
    \ 'copy': {
    \    '+': 'pbcopy',
    \    '*': 'pbcopy',
    \  },
    \ 'paste': {
    \    '+': 'pbpaste',
    \    '*': 'pbpaste',
    \ },
    \ 'cache_enabled': 0,
    \ }
endif

" Markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript', 'python', 'java', 'scala']

" vim-matchup
hi MatchParen ctermfg=red guifg=blue ctermbg=none
hi MatchWord ctermfg=red guifg=blue ctermbg=none

" vim-commentary
nmap <C-/> Commentary

" org-mode
let g:org_agenda_files = ['~/org/index.org', '~/org/project.org']
