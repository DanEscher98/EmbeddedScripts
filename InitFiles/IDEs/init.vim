source $HOME/.config/nvim/vim-plug/plugins.vim
"source $HOME/.config/nvim/themes/jellybeans.vim

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=4
set softtabstop=4
set autoindent
set number
set splitbelow
set splitright
set linebreak
set termguicolors
set scrolloff=12
set modifiable


filetype plugin indent on
syntax enable on

"This keeps the terminal open
augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide
augroup END

"Navigate auto complete options with TAB
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"set cc=80

nnoremap <leader>sv :source $MYVIMRC<CR>

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

autocmd BufNewFile,BufRead *.md set filetype=markdown 
autocmd FileType markdown set cursorline
