source ~/.config/nvim/plugins.vim
" To get all keybinds
" :redir! > vim_keys
" :map
" :map!
" :redir END

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
"set listchars=eol:¬·,tab:\|·,trail:\ ·
set list lcs=tab:\|\ 
" gutter space for lsp info on left
" set signcolumn=yes
" increased for lsp code actions
set updatetime=100
set cursorline tw=60 wrap

" highlights yanked text
"autogroup highlight_yank
"    autocmd!
"    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
"autogroup END

" netrw config
let g:netrw_liststyle = 4
let g:netrw_banner = 0
let g:netrw_browse_split = 2 " Open files in a new vertical split
let g:netrw_minsize = 10

filetype plugin indent on
syntax enable on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab ts=4 sw=4 ai
" Set the number of columns for a TAB
set softtabstop=4
"set autoindent


"This keeps the terminal open
augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide
augroup END

"Navigate auto complete options with TAB
inoremap <expr><Esc>    pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><A-y>    pumvisible() ? "\<C-y>" : "\<A-y>"

" To select a suggestion <C-y>
inoremap <silent><expr> <c-space> coc#refresh()
"set cc=80
" De-TAB  for command and normal mode
"nnoremap <S-Tab> <<
"inoremap <S-Tab> <C-d>
" Save with Ctrl-s
" Allow us to use Ctrl-s and Ctrol-q as keybinds
silent !stty -ixon
inoremap <c-s> <c-o>:Update <bar>echo 'Saved'<CR>
nnoremap <c-s> :<c-u>w <bar>echo 'Saved'<cr>
" Restore default behaviour when leaving vim
autocmd VimLeave * silent !stty ixon
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR><CR>
inoremap <C-S> <C-O>:update <bar>echo 'Saved'<CR><CR>


nnoremap <leader>sv :source $MYVIMRC<CR>
" Disable highlight after pattern search
nnoremap <leader><Space> :noh<CR>

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
autocmd BufNewFile,BufRead *.nasm set filetype=nasm
autocmd BufNewFile,BufRead *.arm set filetype=arm
autocmd FileType markdown setlocal cursorline tw=70 wrap
autocmd FileType html setlocal cursorline tw=80 wrap
autocmd FileType haskell setlocal expandtab
autocmd FileType r setlocal expandtab
autocmd FileType typescript let b:coc_root_patterns=["yarn.lock", "npm.lock", "package.json", "tsconfig.json"]
"autocmd FileType haskell let b:autoformat_autoindent=0
autocmd FileType markdown setlocal expandtab
autocmd FileType tex setlocal expandtab
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

