" " Load plugins with vim-plug
 "call plug#begin('~/.config/nvim/plugged')
" " Disable plugins in vimdiff
" if !&diff
"   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   " " find more coc plugins here: https://www.npmjs.com/search?q=keywords%3Acoc.nvim
"   " Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
"   " " Plug 'mfussenegger/nvim-jdtls'
"   " Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"   " " Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
"   " " Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile'}
"   " Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
"   " " end coc.nvim plugins
"   " Plug 'Vigemus/iron.nvim'
" endif
" " These plugins are allowed in vimdiff mode
" " tpope
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-speeddating'
" Plug 'tpope/vim-repeat'
" " Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-dadbod'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-markdown'
" " Plug 'tpope/vim-tbone'
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-capslock'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-projectionist'
" " end tpope
" " lsp
" " install language servers
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" " the actual lsp config
" Plug 'neovim/nvim-lspconfig'
" " special language servers
" " Plug 'mfussenegger/nvim-jdtls'
" " Plug 'scalameta/nvim-metals'
" " auto-completion
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
" " dap / Debug Adapter Protocol 
" Plug 'mfussenegger/nvim-dap'
" Plug 'nvim-neotest/nvim-nio'
" Plug 'rcarriga/nvim-dap-ui'
" " linters
" " Plug 'mfussenegger/nvim-lint'
" " formatters
" Plug 'mhartington/formatter.nvim'
" " end lsp
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" " Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }
" " Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim', 'as': 'apprentice-airline' }
" Plug 'mbbill/undotree'
" Plug 'godlygeek/tabular'
" Plug 'haya14busa/incsearch.vim'
" Plug 'luochen1990/rainbow'
" " Plug 'justinmk/vim-sneak'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'wellle/targets.vim'
" Plug 'bkad/CamelCaseMotion'
" Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" Plug 'tweekmonster/impsort.vim', { 'on': ['ImpSort'] }
" Plug 'lervag/vimtex', { 'for': ['tex'] }
" Plug 'NLKNguyen/vim-maven-syntax'
" " Plug 'mechatroner/rainbow_csv'
" Plug 'raimon49/requirements.txt.vim'
" Plug 'ambv/black', { 'on': ['Black'] }
" Plug 'embear/vim-localvimrc'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'unblevable/quick-scope'
" " Plug 'andymass/vim-matchup'
" Plug 'uber/prototool', { 'rtp':'vim/prototool' }
" Plug 'mattn/calendar-vim'
" Plug 'freitass/todo.txt-vim'
" Plug 'markonm/traces.vim'
" Plug 'janko/vim-test'
" " Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" Plug 'Curly-Mo/phlebotinum'
" Plug 'tweekmonster/startuptime.vim', { 'on': ['StartupTime'] }
" Plug 'nanotech/jellybeans.vim'
" " Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" " Plug 'nvim-treesitter/playground' " TODO: temporary to learn more about treesitter
" Plug 'ryanoasis/vim-devicons'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'vim-scripts/ReplaceWithRegister'
" Plug 'machakann/vim-highlightedyank'
" Plug 'tommcdo/vim-exchange'
" " Plug 'nacro90/numb.nvim'
" " Plug 'petobens/poet-v'
" Plug 'lukhio/vim-mapping-conflicts'
" Plug 'alok/notational-fzf-vim'
" Plug 'phaazon/hop.nvim'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'lifepillar/vim-colortemplate'
" Plug 'stsewd/gx-extended.vim'
" " Plug 'psliwka/vim-smoothie'
" Plug 'airblade/vim-rooter'
" " plenary deps
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-file-browser.nvim'
" " end plenary deps
" " Plug 'AckslD/nvim-neoclip.lua'
" Plug 'stsewd/fzf-checkout.vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'lambdalisue/vim-suda'
" " git stuff
" Plug 'airblade/vim-gitgutter'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'sindrets/diffview.nvim'
" Plug 'rhysd/conflict-marker.vim'
" Plug 'NeogitOrg/neogit'
 "call plug#end()

" BASICS
" keeping these in init.vim for now to ensure they never get broken by invalid lua configs
" set tempfile location
" in neovim, no need to create these dirs first
"silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/backup > /dev/null 2>&1
"silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/swap > /dev/null 2>&1
"silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/undo > /dev/null 2>&1
let s:config_dir = has('nvim') ? stdpath('config') : '~/.vim'
let s:state_dir = has('nvim') ? stdpath('state') : '~/.vim/tmp'
let s:cache_dir = has('nvim') ? stdpath('cache') : '~/.vim/tmp'
let s:data_dir = has('nvim') ? stdpath('data') : '~/.vim/data'
let &backupdir=s:state_dir . "/backup//"
let &directory=s:state_dir . "/swap//"
let &undodir=s:state_dir . "/undo//"
" Persistent undo
set undofile
set undolevels=50000

" Always open readonly if swapfile exists
" if has("autocmd")
"   autocmd SwapExists * let v:swapchoice = "e"
" endif

" Remember last cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" END BASICS

" TODO: replace with init.lua
lua <<EOF
require("config")
EOF

"" syntax
"syntax on
"" set relativenumber
"set number
"" Turn off auto-commenting
"autocmd FileType * setlocal formatoptions-=c
"autocmd FileType * setlocal formatoptions-=r
"autocmd FileType * setlocal formatoptions-=o
"filetype plugin indent on
""set ruler
"set formatoptions-=cro "don't continue comment marks
"" Relative numbering
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set nonu
"    set nornu
"  else
"    set nu
"    set rnu
"  endif
"endfunc
"
"" Colors
"if exists('+termguicolors')
"  set termguicolors
"endif
"colorscheme phlebotinum
"set cursorline
"" vimdiff
"" highlight DiffAdd    cterm=bold ctermbg=darkgrey
"" highlight DiffDelete cterm=bold ctermbg=darkyellow
"" highlight DiffChange cterm=bold ctermbg=darkcyan
"" highlight DiffText   cterm=bold ctermbg=darkblue ctermfg=darkgrey
"" " fold colors
"" " set fillchars=fold:\
"" highlight Folded ctermbg=235
"" highlight FoldColumn ctermbg=black
"" " vertical divider colors
"" hi VertSplit ctermfg=Black ctermbg=248
"" hi StatusLine ctermfg=236 ctermbg=248
"" hi StatusLineNC ctermfg=236 ctermbg=248
"set fillchars+=vert:│
"" print Syntax Highlight Group of what is under cursor
"function! s:syntax_query()
"  let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
"  return s
"endfunc
"command! SynID call s:syntax_query()
"
"" search
"set hlsearch
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"set ignorecase
"set smartcase
"set incsearch
""set gdefault
"set magic
"" very magic mode for %s/
"" disable because it was confusing
"" cnoremap %s/ %s/\v
"
"" tabs
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
"set expandtab
"autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
"
"" aliases
":command WQ wq
":command Wq wq
":command Q qa!
":command CQ cq
":command Cq cq
":command Bd bd
":command BD bd
"" :command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"" :command W :execute '!sudo tee % > /dev/null'
"" :command W w
":command! W :SudoWrite
":command WW :SudaWrite
":command Wd :Mkdir | w
":command WD :Mkdir | :SudoWrite
":command WWD :Mkdir | :SudaWrite
"" reload vimrc
":command! Reload source $MYVIMRC
"" csv
":command! CSV %!column -t
"" cd
":command CD :cd %:h
":command Groot :cd `git rev-parse --show-toplevel`
":command Proot :Groot
"
"" paste
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F10>
"set noshowmode
"" clipboard
"set clipboard+=unnamedplus
"set mouse=a
"
"" set tempfile location
"" in neovim, no need to create these dirs first
""silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/backup > /dev/null 2>&1
""silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/swap > /dev/null 2>&1
""silent !mkdir -p $XDG_CONFIG_HOME/nvim/tmp/undo > /dev/null 2>&1
"set backupdir=~/.config/nvim/tmp/backup//
"set directory=~/.config/nvim/tmp/swap//
"set undodir=~/.config/nvim/tmp/undo//
"" Persistent undo
"set undofile
"set undolevels=50000
"
"" Always open readonly if swapfile exists
"if has("autocmd")
"  autocmd SwapExists * let v:swapchoice = "o"
"endif
"
"" Remember last cursor position
"if has("autocmd")
"    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
"
"" Split navigation
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-S-LEFT> <C-W><C-H>
"nnoremap <C-S-RIGHT> <C-W><C-L>
"nnoremap <C-S-UP> <C-W><C-K>
"nnoremap <C-S-DOWN> <C-W><C-J>
"
"" vimdiff settings
"set diffopt+=vertical
"set diffopt+=foldcolumn:1
"
"" status
"" set shortmess=a
"
"" Neovim
"" Python
"let g:python3_host_prog = "~/.pyenv/shims/python3"
"let g:python_host_prog = "~/.pyenv/shims/python2"
"
"" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
"" replace currently selected text with default register
"" without yanking it
"vnoremap <leader>p "_dP


""""""PLUGINS"""""""

if !&diff
"""Plugins disable in vimdiff mode"""

"" coc.nvim
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
""
"" set cmdheight=2
"" set nobackup
"" set nowritebackup
"" change buffers with unsaved changes
"set hidden
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1):
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\<Tab>" : coc#refresh()
"inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1): CheckBackspace() ? "\<S-Tab>" : coc#refresh()
"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"" Use `[c` and `]c` for navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> <C-LeftMouse> <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gf <Plug>(coc-references)
"nmap <silent> gr <Plug>(coc-references)
"" Use K for show documentation in preview window
"function! s:show_documentation()
"  if &filetype == 'vim'
"    execute 'h '.expand('<cword>')
"  else
"    call CocActionAsync('doHover')
"  endif
"endfunction
"nmap <silent> gk :call <SID>show_documentation()<CR>
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"" hi CocHighlightText ctermbg=236
"" hi CocFloating ctermbg=238
"" hi Pmenu ctermbg=248
"" hi PmenuSbar ctermbg=248
"" hi PmenuThumb ctermbg=darkgrey
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"" Remap for format selected region
"vmap <leader>f <Plug>(coc-format-selected)
"" nmap <leader>f <Plug>(coc-format-selected)
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"vmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <leader>a <Plug>(coc-codeaction-selected)
"" Remap for do codeAction of current line
"nmap <leader>ac <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf <Plug>(coc-fix-current)
"" Support jsonc syntax highlighting
"autocmd FileType json syntax match Comment +\/\/.\+$+
"" organize imports with command and hotkey
"command! -nargs=0 Org :call CocAction('runCommand', 'editor.action.organizeImport')
"nmap <leader>o :Org<CR>
"nmap <silent>go :Org<CR>
"" show action menu
"nmap <silent> ga <Plug>(coc-codeaction-selected)<CR>
"" show command menu
"nmap <silent> <leader>gc :CocList commands<cr>

"" coc-python
"" add local paths to python path for local imports
"" current working dir, current buffer dir, current buffer parent dir, any parent dir to buffer named 'python'
"autocmd FileType python let g:coc_user_config = {
"      \"python.autoComplete.extraPaths": [
"        \substitute(expand('%:p:h'), '\v(.*python)\/.*', '\1', ''),
"        \expand('%:p:h'),
"        \fnamemodify(expand('%:p:h'), ':h'),
"        \getcwd(),
"        \],
"      \}

"""end plugins disable in vimdiff mode"""
endif

"" coc-git
"" navigate chunks of current buffer
"nmap [g <Plug>(coc-git-prevchunk)
"nmap ]g <Plug>(coc-git-nextchunk)
"" navigate conflicts of current buffer
"" conflicts with coc diagnostic keys
"" nmap [c <Plug>(coc-git-prevconflict)
"" nmap ]c <Plug>(coc-git-nextconflict)
"nmap gO :CocCommand git.browserOpen<CR>
"nmap gl :CocCommand git.copyUrl<CR>
""chunks
"nmap ghi <Plug>(coc-git-chunkinfo)
"nmap ghs :CocCommand git.chunkStage<CR>
"nmap ghu :CocCommand git.chunkUndo<CR>
"" " show commit contains current position
"" nmap gp <Plug>(coc-git-commit)
""" create text object for git chunks
""omap ig <Plug>(coc-git-chunk-inner)
""xmap ig <Plug>(coc-git-chunk-inner)
""omap ag <Plug>(coc-git-chunk-outer)
""xmap ag <Plug>(coc-git-chunk-outer)

"""Plugins allowed in vimdiff mode"""

" suda
" let g:suda_smart_edit = 1
" let g:suda#noninteractive = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='phlebotinum'
let g:airline_skip_empty_sections = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep =  '|'
" let g:airline_right_alt_sep = '|'
" let g:airline_left_alt_sep = '|'
" let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.clipboard = '🅒'
let g:airline_symbols.paste = '🅟'
let g:airline_symbols.spell = '🅢'
" let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.ellipsis = '…'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
" airline-tabline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#buffer_min_count = 2
" let g:airline#extensions#tabline#left_sep = '|'
" let g:airline#extensions#tabline#right_sep = '|'
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#show_close_button = 1
" other extensions
let g:airline#extensions#hunks#coc_git = 1
" airline-coc
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = '✗'
let g:airline#extensions#coc#warning_symbol = '⚠'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

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

" " Rainbow Parens
" let g:rainbow_active = 1
" let g:rainbow_conf = {
" \ 'guifgs': [g:terminal_color_14, g:terminal_color_10, g:terminal_color_13, g:terminal_color_2],
" \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \ 'operators': '_,_',
" \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \ 'separately': {
" \   '*': {},
" \ }
" \}

" " Indent-guides
" let g:indent_guides_auto_colors = 0
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=235

" IncSearch
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" highlight IncSearch ctermfg=cyan term=underline

" " CamelCaseMotion
" let g:camelcasemotion_key = '<leader>'

" " rainbow csv
" nnoremap <localleader>csv :RainbowDelim<CR>

" " black
" let g:black_skip_string_normalization = 1
" let g:black_linelength = 120

" " localvimrc
" let g:localvimrc_whitelist='~/workspace/.*'

" " gitgutter
" let g:gitgutter_enabled = 1
" " set updatetime=500
" highlight GitGutterAdd ctermfg=65 ctermbg=none guifg=#5f875f guibg=none
" highlight GitGutterChange ctermfg=103 ctermbg=none guifg=#8787af guibg=none
" highlight GitGutterDelete ctermfg=131 ctermbg=none guifg=#703020 guibg=none
" nmap [h <Plug>(GitGutterPrevHunk)
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [g <Plug>(GitGutterPrevHunk)
" nmap ]g <Plug>(GitGutterNextHunk)
" let g:gitgutter_preview_win_floating = 1

" fugitive
let g:github_enterprise_urls = ['https://ghe.spotify.net']
nnoremap <leader>gl :Gclog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gB :GBrowse<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gC :Git commit<CR>
nnoremap <leader>gs :Git<CR>

" quick-scope
"highlight QuickScopePrimary guifg=#fac863 ctermfg=221 gui=underline cterm=underline
"highlight QuickScopeSecondary guifg=#fac863 ctermfg=221 gui=underline cterm=underline
"highlight QuickScopeSecondary guifg=#8fbfdc ctermfg=110 gui=underline cterm=underline

" Smoother scrolling
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" MacOS clipboard, slow startup time searching for clipboard provider if not set
" if has('macunix')
"   let g:clipboard = {
"     \ 'name': 'pbcopy',
"     \ 'copy': {
"     \    '+': 'pbcopy',
"     \    '*': 'pbcopy',
"     \  },
"     \ 'paste': {
"     \    '+': 'pbpaste',
"     \    '*': 'pbpaste',
"     \ },
"     \ 'cache_enabled': 0,
"     \ }
" endif

" Markdown
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'js=javascript', 'typescript', 'python', 'java', 'scala', 'bash=sh']

" vim-commentary
nmap <M-/> :Commentary<CR>
vmap <M-/> :Commentary<CR>

" vim-sneak
" Won't play nicely with quickscope, quickscope wins for now
" " replace 'f' with 1-char sneak
" map f <Plug>Sneak_f
" nmap F <Plug>Sneak_F
" xmap f <Plug>Sneak_f
" xmap F <Plug>Sneak_F
" omap f <Plug>Sneak_f
" omap F <Plug>Sneak_F
" " replace 't' with 1-char Sneak
" nmap t <Plug>Sneak_t
" nmap T <Plug>Sneak_T
" xmap t <Plug>Sneak_t
" xmap T <Plug>Sneak_T
" omap t <Plug>Sneak_t
" omap T <Plug>Sneak_T
" " sneak label-mode (like easymotion)
" let g:sneak#label = 1
" nmap s <Plug>SneakLabel_s
" nmap S <Plug>SneakLabel_S

" vim-rhubarb
let g:github_enterprise_urls = ['https://ghe.spotify.net']

" fzf
" Mapping selecting mappings
" nnoremap <C-p> :<C-u>FZF<CR>
"command! -nargs=* GFilesOrFiles execute (len(system('git rev-parse'))) ? ':Files <args>' : ':GFiles <args>'
"command! FilesFromDirOrRoot execute (len(system('fd | wc -l')) < 3) ? ':Files ' . FindRootDirectory() : ':GFilesOrFiles'
"function! Fd_cmd()
"  let l:root = FindRootDirectory()
"  if len(l:root) == 0
"    " return  printf("fd --hidden --exclude .git --full-path --color=always | proximity-sort %s", expand('%:p:h'))
"    return  printf("fd --hidden --exclude .git --full-path | proximity-sort %s", expand('%:p:h'))
"  endif
"  " return  printf("fd --hidden --exclude .git --full-path --color=always --base-directory %s | proximity-sort %s", root, expand('%:p:h'))
"  return  printf("fd --hidden --exclude .git --full-path --base-directory %s | proximity-sort %s", root, expand('%:p:h'))
"  " return  printf("fd --hidden --exclude .git --full-path --base-directory %s", root)
"endfunction
"command! -bang -nargs=? -complete=dir FilesProximity
"  \ call fzf#vim#files(<q-args>, {'source': Fd_cmd(),
"  \                               'options': '--tiebreak=index'}, <bang>0)
""" nnoremap <C-p> :GFilesOrFiles<CR>
""" nnoremap <C-p> :FilesFromDirOrRoot<CR>
""nnoremap <C-p> :FilesProximity<CR>
""" nnoremap <C-p> :Files<CR>
""nnoremap <C-b> :Buffers<CR>
""" nnoremap <leader>s :<C-u>FZF<CR>
""nnoremap <leader>s :Files<CR>
""" nnoremap <leader>f :GFiles<CR>
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-l> <plug>(fzf-complete-line)
"" Path completion with custom source command
"inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd --type f --hidden --exclude .git')
"" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
"" Word completion with custom spec with popup layout option
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
"" Config
"let g:fzf_layout = { 'window': { 'width': 0.99, 'height': 0.99 } }
"let g:fzf_preview_window = ['right:50%', 'ctrl-/']
"let g:fzf_history_dir = '~/.config/nvim/tmp/fzf-history'
"" TODO: experimental, remoe these
"" let g:fzf_preview_use_dev_icons = 1
"" let g:fzf_preview_command = 'bat --color=always --plain {-1}'
"" fzf cd
"command! -bang -bar -nargs=? -complete=dir C
"    \ call fzf#run(fzf#wrap(
"    \ {'source': 'fd --type d --hidden --exclude .git',
"    \ 'sink': 'cd'}))

" " Vista.vim
" " let g:vista_icon_indent = ["╰─▸", "├─▸"]
" " let g:vista_icon_indent = ["▸ ", ", "]
" let g:vista#renderer#enable_icon = 1
" let g:vista_sidebar_width = 25
" " let g:vista_default_executive = 'coc'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista_keep_fzf_colors = 1
" let g:vista_echo_cursor_strategy = 'both'
" let g:vista_blink = [3, 50]
" let g:vista_cursor_delay = 200
" let g:vista_floating_delay = 400
" map <M-;> :Vista!!<CR>
" map <M-'> :Vista focus<CR>
" autocmd FileType vista,vista_kind nnoremap <buffer> <silent>/ :<c-u>call vista#finder#fzf#Run()<CR>


" " poet-v
" " let g:poetv_executables = ['poetry', 'pipenv']
" let g:poetv_executables = ['poetry']
" " let g:poetv_auto_activate = 0
" " let g:poetv_statusline_symbol = ''
" " let g:poetv_set_environment = 1

"" notational-fzf-vim
"nnoremap <silent> <c-s> :NV!<CR>
"" nnoremap <silent> <c-S> :NV<CR>work/
"let g:nv_search_paths = ['~/sync/notes/fzfvim', './notes']
""" String. Set to '' (the empty string) if you don't want an extension appended by default.
""" Don't forget the dot, unless you don't want one.
""let g:nv_default_extension = '.md'
""" String. Default is first directory found in `g:nv_search_paths`. Error thrown
"""if no directory found and g:nv_main_directory is not specified
"""let g:nv_main_directory = g:nv_main_directory or (first directory in g:nv_search_paths)
"let g:nv_main_directory = '~/sync/notes/fzfvim'
""" Dictionary with string keys and values. Must be in the form 'ctrl-KEY':
""" 'command' or 'alt-KEY' : 'command'. See examples below.
""let g:nv_keymap = {
""                    \ 'ctrl-s': 'split ',
""                    \ 'ctrl-v': 'vertical split ',
""                    \ 'ctrl-t': 'tabedit ',
""                    \ })
""" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
""let g:nv_create_note_key = 'ctrl-x'
""" String. Controls how new note window is created.
""let g:nv_create_note_window = 'vertical split'
""" Boolean. Show preview. Set by default. Pressing Alt-p in FZF will toggle this for the current search.
""let g:nv_show_preview = 1
""" Boolean. Respect .*ignore files in or above nv_search_paths. Set by default.
""let g:nv_use_ignore_files = 1
""" Boolean. Include hidden files and folders in search. Disabled by default.
""let g:nv_include_hidden = 0
""" Boolean. Wrap text in preview window.
""let g:nv_wrap_preview_text = 1
""" String. Width of window as a percentage of screen's width.
""let g:nv_window_width = '40%'
""" String. Determines where the window is. Valid options are: 'right', 'left', 'up', 'down'.
""let g:nv_window_direction = 'down'
""" String. Command to open the window (e.g. `vertical` `aboveleft` `30new` `call my_function()`).
""let g:nv_window_command = 'call my_function()'
""" Float. Width of preview window as a percentage of screen's width. 50% by default.
""let g:nv_preview_width = 50
""" String. Determines where the preview window is. Valid options are: 'right', 'left', 'up', 'down'.
""let g:nv_preview_direction = 'right'
""" String. Yanks the selected filenames to the default register.
""let g:nv_yank_key = 'ctrl-y'
""" String. Separator used between yanked filenames.
""let g:nv_yank_separator = "\n"
""" Boolean. If set, will truncate each path element to a single character. If
""" you have colons in your pathname, this will fail. Set by default.
""let g:nv_use_short_pathnames = 1
"""List of Strings. Shell glob patterns. Ignore all filenames that match any of
""" the patterns.
""let g:nv_ignore_pattern = ['summarize-*', 'misc*']
""" List of Strings. Key mappings like above in case you want to define your own
""" handler function. Most users won't want to set this to anything.
""let g:nv_expect_keys = []

" " undotree
" nnoremap <F5> :UndotreeToggle<CR>
" let g:undotree_SetFocusWhenToggle = 1

" " vim-test
" nmap <silent> <leader>gt :TestNearest<CR>
" nmap <silent> <leader>gT :TestFile<CR>
" nmap <silent> gT :TestFile<CR>
" nmap <silent> <leader>ga :TestSuite<CR>
" nmap <silent> <leader>gl :TestLast<CR>
" let test#strategy = "neovim"
" let test#java#maventest#options = '-T 4 -Dcheckstyle.skip -Dspotbugs.skip -Ddockerfile.skip -Ddockerfile.skip'

" " vim-ultest
" let g:ultest_use_pty = 1
" let g:ultest_max_threads = 1
" let g:ultest_summary_width = 30
" augroup UltestRunner
"     au!
"     au BufWritePost * UltestNearest
" augroup END
" nmap ]t <Plug>(ultest-next-fail)
" nmap [t <Plug>(ultest-prev-fail)
" nmap <silent> <leader>t <Plug>(ultest-run-nearest)
" nmap <silent> <leader>T <Plug>(ultest-run-file)
" nmap <silent> gt :UltestSummary!<CR>
" let g:ultest_disable_grouping = ["java"]

" " vim-smoothie
" let g:smoothie_enabled = 1
" let g:smoothie_update_interval = 1
" let g:smoothie_speed_constant_factor = 15
" let g:smoothie_speed_linear_factor = 40
" let g:smoothie_speed_exponentiation_factor = 0.999
" let g:smoothie_no_default_mappings = 0
" let g:smoothie_experimental_mappings = 1
" let g:smoothie_break_on_reverse = 0

" " rooter
" let g:rooter_manual_only = 1
