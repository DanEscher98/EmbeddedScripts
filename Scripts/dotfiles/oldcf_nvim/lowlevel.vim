Plug 'rhysd/vim-llvm'
Plug 'maxbane/vim-asm_ca65'
Plug 'mfulz/cscope.nvim'
Plug 'preservim/tagbar'
Plug 'ARM9/arm-syntax-vim'

" COC Extensions
" coc-clangd
" cargo install asm-lsp

" TAGBAR CONFIG
nmap <F8> :TagbarToggle<CR>
autocmd FileType c call tagbar#autoopen(0)

autocmd BufNewFile,BufRead *.nasm set filetype=nasm
autocmd BufNewFile,BufRead *.arm set filetype=arm

