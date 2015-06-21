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

" Actual list of plugins
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-rooter'
Plugin 'luochen1990/rainbow'
Plugin 'flazz/vim-colorschemes'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'eiginn/netrw'
Plugin 'mileszs/ack.vim'
Plugin 'gregsexton/gitv'
Plugin 'burnettk/vim-angular'
" Plugin 'Valloric/YouCompleteMe'
" js options to try out
Plugin 'pangloss/vim-javascript'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'
Plugin 'rizzatti/dash.vim'
Plugin 'othree/html5.vim'

call vundle#end()
filetype plugin indent on

" --------------------- end Vundle

" Basic options -------------------------------------
syntax on " syntax coloration
syntax sync minlines=256
set synmaxcol=2048
set autoindent
set smartindent
set formatoptions=tcqr

set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title " change the terminal's title
set visualbell " don't beep
set noerrorbells " don't beep

set cursorline
set mousehide

set number
set nowrap
set list
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set hlsearch
set incsearch
set wrapscan

set ignorecase
set smartcase

set t_Co=256

" ------------------------- end Basic options

" UltiSnip options ---------------
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" set the color scheme to molokai
colorscheme molokai
let g:molokai_original = 1

" settings for NERDTree
nmap <F6> :NERDTreeToggle<CR>

" settings for the airline, status line plugin
let g:airline#extensions#tabline#enabled = 1

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
let g:syntastic_html_tidy_exec = 'tidy5 -config ~/.vim/tidy.conf'
" ----------------------------------------- end syntastic settings
let g:indentLine_color_term = 239

set cot-=preview

" avoid eclim temp files
let g:EclimTempFilesEnable = 0

" ignore some files, especially for Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,/node_modules/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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
