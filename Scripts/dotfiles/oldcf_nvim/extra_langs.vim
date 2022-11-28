Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'OmniSharp/omnisharp-vim' " C#
Plug 'alaviss/nim.nvim'

" COC Extensions
" coc-rust-analyzer
" coc-clojure
" coc-go
" rustup component add rustfmt

let g:rustfmt_autosave = 1
let g:OmniSharp_server_use_net6 = 1

autocmd FileType haskell setlocal expandtab
autocmd FileType r setlocal expandtab
"autocmd FileType haskell let b:autoformat_autoindent=0

autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
