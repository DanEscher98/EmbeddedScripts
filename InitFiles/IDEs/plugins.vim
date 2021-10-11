call plug#begin('~/.config/nvim/autoload/plugged')
" IDE stuff
    " File Explorer
    Plug 'scrooloose/NERDtree'
    " Comment plugin
    "Plug 'scrooloose/nerdcommenter'
    " General Syntax Checker
    "Plug 'scrooloose/syntastic'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Git Integration
    Plug 'tpope/vim-fugitive'
    " REPL Integration
    "Plug 'jpalardy/vim-slime'
    " Autocompletition
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'dense-analysis/ale'
    " Zen Mode
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

" Programming Languages
    " Basic Haskell
    Plug 'eagletmt/ghcmod-vim'
    Plug 'neovimhaskell/haskell-vim'
    " Julia
    Plug 'julialang/julia-vim'
    " Clang
    Plug 'rip-rip/clang_complete'
    " Racket
    Plug 'wlangstroth/vim-racket'
" Markup Languages
    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    " LaTeX
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    " YAML, TOML, JSON
    Plug 'cespare/vim-toml'
    Plug 'elzr/vim-json'

" Appearence
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Gobal Theme
    Plug 'rafalbromirski/vim-aurora'
    " LightLine
    Plug 'itchyny/lightline.vim'

call plug#end()


set termguicolors
colorscheme aurora
"let g:ale_disable_lsp = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" LaTeX
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex' . '--shell-escape'

" Zen Mode
nnoremap <C-g> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" LightLine
let g:lightline = {'colorscheme': 'one'}
