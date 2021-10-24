call plug#begin('~/.config/nvim/autoload/plugged')
" IDE stuff
    " File Explorer
    Plug 'scrooloose/NERDtree'
	Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Autocompletition
    Plug 'scrooloose/syntastic'
	Plug 'scrooloose/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'Chiel92/vim-autoformat'
    " Zen Mode
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
	" Git Plugin
	Plug 'tpope/vim-fugitive'
" Appearence
	" Set icons
	Plug 'ryanoasis/vim-devicons'
	Plug 'drewtempelmeyer/palenight.vim'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    " LightLine
    Plug 'itchyny/lightline.vim'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Rainbow Parenthesis
    Plug 'luochen1990/rainbow'
    " Smooth Scrool
    Plug 'psliwka/vim-smoothie'
	" Show indentation with spaces
	" Yggdroot/indentLine
" Markup Languages
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'alvan/vim-closetag'
    Plug 'lervag/vimtex'
" Programming Languages
    Plug 'alx741/vim-stylishask'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'rust-lang/rust.vim'
	Plug 'ARM9/arm-syntax-vim'
	Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build',
				\ 'branch': 'main' }
	Plug 'dag/vim-fish'
call plug#end()

autocmd VimEnter * if !argc() | NERDTree | endif

" Font
set guifont=Ubuntu

let g:rainbow_active = 1
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics=1
let g:stylishask_on_save = 1

" Zen Mode
nnoremap <C-g> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" Ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-s>"

" Syntastic options
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"let g:syntastic_python_checkers=['python3', 'flake8
			"\ --ignore=E225,E501,E302,E261,E262,E701,E241,E126,E127,E128,W801']
"let g:syntastic_python_flake8_exec = ['/home/dany98/miniconda3/bin/flake8']
"let g:syntastic_python_pylint_exec = '/home/dany98/.local/bin/pylint'
" g:syntastic_asm_checkers = ['nasm']

" Ale Linterns
let g:ale_linterns = {
    \ 'go': ['gopls'],
    \ 'haskell': ['hlint'],
    \ 'python': ['flake8']
    \ }
let g:ale_lint_on_enter=1
let g:ale_cursor_detail=1
let g:ale_python_auto_pipenv = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let pipenv_venv_path = system('pipenv --venv')
