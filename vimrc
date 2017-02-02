" Let's do it.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

set nocompatible

" Vundle --------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required by Vundle
Plugin 'gmarik/vundle'

" 'Set of defaults everyone can agree on'
Plugin 'tpope/vim-sensible'

" Coloration plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'luochen1990/rainbow'

" Git support
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'scrooloose/syntastic'

" =====> IDE-like features
" Contextual windows and display
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-rooter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Search
Plugin 'ctrlpvim/ctrlp.vim'

" Completions
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
" <=====

" Go plugin
Plugin 'fatih/vim-go'

" Dependancy for plugins after
Plugin 'Shougo/vimproc.vim'

" Typescript and Angular plugins
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/ng-tsserver'
Plugin 'bdauria/angular-cli.vim'

" Snippet plugins
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

" --------------------- end Vundle

" Basic options -------------------------------------
syntax on " syntax coloration
syntax sync minlines=256
filetype plugin indent on
set synmaxcol=2048
set autoindent
set smartindent
set formatoptions=tcqr

set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
set visualbell " don't beep
set t_vb= " don't even beep visually
set noerrorbells " don't beep

set cursorline
set mousehide

set number
set nowrap
set list
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set mouse=a

" Can be a problem in event of a crash
set noswapfile

set hlsearch
set incsearch
set wrapscan

set ignorecase
set smartcase

set t_Co=256

" ------------------------- end Basic options

" Change leader
let mapleader = ","

" UltiSnip options ---------------
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" set the color scheme to molokai
colorscheme molokai
let g:molokai_original = 1

" settings for NERDTreeTabs
nmap <F6> :NERDTreeTabsToggle<CR>

" settings for the airline, status line plugin
let g:airline#extensions#tabline#enabled = 1
" To be set to one in a terminal that support powerline fonts
let g:airline_powerline_fonts = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" settings for syntastic --------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
" let g:syntastic_html_tidy_exec = 'tidy5 -config ~/.vim/tidy.conf'
" ----------------------------------------- end syntastic settings
let g:indentLine_color_term = 239

set cot-=preview

" ignore some files, especially for Ctrl-P
set wildignore+=*/tmp/*,*.so,*.zip,*/target/*,/node_modules/*
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|node_modules\|bower_components',
    \ 'file': 'DS_Store'
    \ }
let g:ctrlp_show_hidden = 1

" Rainbow parenthesis and brackets coloration
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Tagbar settings
nmap <F8> :TagbarToggle<CR>
" autocmd BufEnter * nested :call tagbar#autoopen(0)

autocmd FileType qf wincmd J

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

" Go settings
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Angular and Typescript settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_option = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" Open file from CtrlP in a new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:NERDTreeMouseMode = 2
