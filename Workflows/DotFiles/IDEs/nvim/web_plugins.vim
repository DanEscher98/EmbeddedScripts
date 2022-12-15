Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'posva/vim-vue'


" COC Extensions
" coc-psalm
" coc-phpls
" coc-blade
" coc-html
" coc-tsserver
" coc-vetur

let g:closetag_filetypes = 'html,xhtml,phtml,vue,php'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.php'
let g:vim_vue_plugin_config = {
			\'syntax': {
				\   'template': ['html'],
				\   'script': ['javascript', 'typescript'],
				\   'style': ['css'],
				\ 'route': 'json'
				\},
				\'full_syntax': ['json'],
				\'initial_indent': [],
				\'attribute': 0,
				\'keyword': 0,
				\'foldexpr': 0,
				\'debug': 0,
				\}
autocmd FileType html setlocal cursorline tw=80 wrap
