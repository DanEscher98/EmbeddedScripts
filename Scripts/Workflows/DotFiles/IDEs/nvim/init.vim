let g:python3_host_prog = '/usr/bin/python3.10'
source $HOME/.config/nvim/plugins.vim

set encoding=utf-8
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
" Close buffer withou closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Navigate between opened buffers
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" move among buffers with CTRL
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
nnoremap <leader>b :ls<CR>:b<Space>

" Resize buffers
map <S-LEFT> :vertical resize +5 <Cr>
map <S-RIGHT> :vertical resize -5 <Cr>
map <S-UP> :resize +5 <Cr>
map <S-DOWN> :resize -5 <Cr>

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal cursorline tw=70 wrap
autocmd FileType rst setlocal cursorline tw=70 wrap
autocmd FileType markdown setlocal expandtab
autocmd FileType php setlocal cursorline tw=120 wrap
autocmd FileType markdown setlocal foldcolumn=0
autocmd FileType tex setlocal expandtab
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store foldsc
