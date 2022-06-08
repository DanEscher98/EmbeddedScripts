source ~/.config/nvim/plugins.vim

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set number
set splitbelow
set splitright
set linebreak
set termguicolors
set scrolloff=12
set modifiable
set autoindent
set smartcase
set nofoldenable
set foldcolumn=0
set signcolumn=no
set nomodeline
"set listchars=eol:¬·,tab:\|·,trail:\ ·
set list lcs=tab:\|\ " Show only pipe for TAB
" gutter space for lsp info on left
" set signcolumn=yes
" increased for lsp code actions
set updatetime=100
set cursorline tw=60 wrap

filetype plugin indent on
syntax enable on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" Set the number of columns for a TAB
set softtabstop=4

"Navigate auto complete options with TAB
inoremap <expr><Esc>    pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><A-y>    pumvisible() ? "\<C-y>" : "\<A-y>"

nnoremap <leader>sv :source $MYVIMRC<CR>
" Disable highlight after pattern search
nnoremap <leader><Space> :noh<CR>

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.nasm set filetype=nasm
autocmd BufNewFile,BufRead *.arm set filetype=arm
autocmd FileType markdown setlocal cursorline tw=70 wrap
autocmd FileType html setlocal cursorline tw=80 wrap
autocmd FileType haskell setlocal expandtab
autocmd FileType r setlocal expandtab
autocmd FileType typescript let b:coc_root_patterns=["yarn.lock", "npm.lock", "package.json", "tsconfig.json"]
"autocmd FileType haskell let b:autoformat_autoindent=0
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal foldcolumn=0
autocmd FileType tex setlocal expandtab
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store foldsc
