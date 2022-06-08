call plug#begin('~/.config/nvim/autoload/plugged')
" IDE STUFF
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'     " Rainbow Parenthesis
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
" LANGUAGES
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
call plug#end()


" THEME APPEARENCE
set background=dark
let g:rainbow_active=1
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
			\   'theme': {
			\     'default.dark': {
			\       'transparent_background': 1
			\     }
			\   }
			\ }


" SHOW DOCUMENTATION
nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction


" CONQUEROR OF COMPLETITION SETUP
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:indentLine_setColors = 1
let g:indentLine_char = '|'

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Ale Linterns
let g:ale_linterns = {
			\ 'go': ['gopls'],
			\ 'haskell': ['hlint'],
			\ 'python': ['pep8'],
			\ 'sh': ['language_server'],
			\ 'rust': ['analyzer']
			\ }
let g:ale_lint_on_enter=1
let g:ale_cursor_detail=1
let g:ale_python_auto_pipenv = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" NeoAutoformat config
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_basic_format_trim=1
let g:neoformat_basic_format_align=1
let g:neoformat_run_all_formatters=1
let g:neoformat_only_msg_on_error=1


" Markdown
let g:vim_json_syntax_conceal=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_follow_anchor=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1

" Python
