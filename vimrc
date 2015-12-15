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
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'airblade/vim-rooter'
Plugin 'luochen1990/rainbow'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'rgrinberg/vim-ocaml'

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

" Change leader
let mapleader = ","

" set the color scheme to molokai
colorscheme molokai
let g:molokai_original = 1

" settings for NERDTreeTabs
nmap <F6> :NERDTreeTabsToggle<CR>

" settings for the airline, status line plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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

" Ocaml indent
set rtp+=~/.vim/plugin/ocp-indent-vim
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

" Tagbar settings
nmap <F8> :TagbarToggle<CR>

