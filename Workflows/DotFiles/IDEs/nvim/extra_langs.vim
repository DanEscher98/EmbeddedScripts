Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'OmniSharp/omnisharp-vim' " C#


" COC Extensions
" coc-rust-analyzer
" coc-rls
" coc-clojure
" coc-go
" rustup component add rustfmt

let g:rustfmt_autosave = 1
let g:OmniSharp_server_use_net6 = 1

autocmd FileType haskell setlocal expandtab
autocmd FileType r setlocal expandtab
"autocmd FileType haskell let b:autoformat_autoindent=0

