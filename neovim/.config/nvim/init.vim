" Load plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
" Disable plugins in vimdiff
if !&diff
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " find more coc plugins here: https://www.npmjs.com/search?q=keywords%3Acoc.nvim
  Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
  Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
  Plug 'liuchengxu/vista.vim'
" end coc.nvim plugins
" Plug 'Vigemus/iron.nvim'
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
" Plug 'tpope/vim-tbone'
Plug 'tpope/vim-rhubarb', { 'on': ['Gbrowse'] }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
" end tpope
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim', 'as': 'apprentice-airline' }
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
" Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'tweekmonster/impsort.vim', { 'on': ['ImpSort'] }
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'NLKNguyen/vim-maven-syntax'
Plug 'mechatroner/rainbow_csv'
Plug 'plytophogy/vim-diffchanges'
Plug 'raimon49/requirements.txt.vim'
Plug 'ambv/black', { 'on': ['Black'] }
Plug 'embear/vim-localvimrc'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'unblevable/quick-scope'
Plug 'andymass/vim-matchup'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'mattn/calendar-vim'
Plug 'freitass/todo.txt-vim'
Plug 'markonm/traces.vim'
" Plug 'janko/vim-test'
Plug 'Curly-Mo/phlebotinum'
Plug 'tweekmonster/startuptime.vim', { 'on': ['StartupTime'] }
Plug 'nanotech/jellybeans.vim'
" disable polyglot in favor of treesitter
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Colors
if exists('+termguicolors')
  set termguicolors
endif
colorscheme phlebotinum
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
set fillchars+=vert:│

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
" very magic mode for %s/
cnoremap %s/ %s/\v

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
:command CQ cq
:command Cq cq
:command Bd bd
:command BD bd
" :command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" :command W :execute '!sudo tee % > /dev/null'
" :command W w
:command W :execute ':SudoWrite'
:command Wd :execute ':Mkdir' | w
:command WD :execute ':Mkdir' | :execute ':SudoWrite'
" reload vimrc
:command! Reload source $MYVIMRC
" csv
:command! CSV %!column -t

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

" Always open readonly if swapfile exists
if has("autocmd")
  autocmd SwapExists * let v:swapchoice = "o"
endif

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

" vimdiff settings
set diffopt+=vertical
set diffopt+=foldcolumn:1

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
nmap <silent> gk :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" hi CocHighlightText ctermbg=236
" hi CocFloating ctermbg=238
" hi Pmenu ctermbg=248
" hi PmenuSbar ctermbg=248
" hi PmenuThumb ctermbg=darkgrey
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
nmap <silent>go :Org<CR>
" add current working dir to python path for local imports
let cwd = getcwd()
autocmd FileType python let g:coc_user_config = {"python.autoComplete.extraPaths": [getcwd()],}
" show action menu
nmap <silent> ga <Plug>(coc-codeaction-selected)<CR>

endif

"""Plugins allowed in vimdiff mode"""

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='phlebotinum'
" let g:airline_theme='jellybeans'
" let g:airline_theme='apprentice'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buf_min_count = 2
" let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#formatter = 'short_path'
" let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
" let g:airline_section_b = airline#section#create(['hunks'])
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '✗'
let g:airline#extensions#coc#warning_symbol = '⚠'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_skip_empty_sections = 1

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

" Rainbow Parens
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'guifgs': [g:terminal_color_14, g:terminal_color_10, g:terminal_color_13, g:terminal_color_2],
\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\ 'operators': '_,_',
\ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\ 'separately': {
\   '*': {},
\ }
\}

" Indent-guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=235

" IncSearch
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" highlight IncSearch ctermfg=cyan term=underline

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" rainbow csv
nnoremap <localleader>csv :RainbowDelim<CR>

" black
let g:black_skip_string_normalization = 1
let g:black_linelength = 120

" localvimrc
let g:localvimrc_whitelist='/Users/colinfahy/workspace/.*'

" gitgutter
set updatetime=500
highlight GitGutterAdd ctermfg=2 ctermbg=none
highlight GitGutterChange ctermbg=none
highlight GitGutterDelete ctermfg=1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" g:gitgutter_preview_win_floating = 0

" fugitive
let g:github_enterprise_urls = ['https://ghe.spotify.net']

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=300
highlight QuickScopePrimary guifg=#fac863 ctermfg=221 gui=underline cterm=underline
highlight QuickScopeSecondary guifg=#fac863 ctermfg=221 gui=underline cterm=underline
highlight QuickScopeSecondary guifg=#8fbfdc ctermfg=110 gui=underline cterm=underline

" Smoother scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

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
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript', 'python', 'java', 'scala']

" vim-matchup
" hi MatchParen guifg=#b1d8f6 ctermfg=012 ctermbg=none
" hi MatchWord guifg=#b1d8f6 ctermfg=012 ctermbg=none
" let g:matchup_enabled = 0
" let g:matchup_matchparen_enabled = 0
" let g:matchup_motion_enabled = 0
" let g:matchup_text_obj_enabled = 0

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

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,                    -- false will disable the whole extension
      disable = { },                    -- list of language that will be disabled
      custom_captures = {               -- mapping of user defined captures to highlight groups
        -- ["foo.bar"] = "Identifier"   -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
      },
    },
    incremental_selection = {
      enable = true,
      disable = { },
      keymaps = {                       -- mappings for incremental selection (visual mappings)
        init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
        node_incremental = "grn",       -- increment to the upper named parent
        scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "grm",       -- decrement to the previous node
      }
    },
    refactor = {
      highlight_definitions = {
        enable = true
      },
      highlight_current_scope = {
        enable = false
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr"          -- mapping to rename reference under cursor
        }
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",      -- mapping to go to definition of symbol under cursor
          list_definitions = "gnD"      -- mapping to list all definitions in current file
        }
      }
    },
    textobjects = { -- syntax-aware textobjects
      enable = true,
      disable = {},
      keymaps = {
          ["iL"] = { -- you can define your own textobjects directly here
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function"
          },
          -- or you use the queries from supported languages with textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["aC"] = "@class.outer",
          ["iC"] = "@class.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["ae"] = "@block.outer",
          ["ie"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["is"] = "@statement.inner",
          ["as"] = "@statement.outer",
          ["ad"] = "@comment.outer",
          ["am"] = "@call.outer",
          ["im"] = "@call.inner"
      }
    },
    ensure_installed = "all" -- one of "all", "language", or a list of languages
}
EOF

" fzf
" Mapping selecting mappings
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <leader>s :<C-u>FZF<CR>
nnoremap <leader>f :Files<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
" TODO: experimental, remoe these
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_command = 'bat --color=always --plain {-1}'

" Vista.vim
let g:vista_icon_indent = ["╰─▸", "├─▸"]
" let g:vista_icon_indent = ["▸ ", ", "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 30
map <M-;> :Vista!!<CR>
autocmd FileType vista,vista_kind nnoremap <buffer> <silent>/ :<c-u>call vista#finder#fzf#Run()<CR>

