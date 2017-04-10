" new vim config

set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent on  " required!

set expandtab
set tabstop=2
set shiftwidth=2

" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set bs=2
" set ts=4
" set sw=4
set number

noremap ,i i_<Esc>r
noremap ,a a_<Esc>r

noremap <I 0i_<Esc>r
noremap <A A_<Esc>r

" shows row and column number at bottom right corner
set ruler

" Configuration
set ignorecase

" showmode
set showmode

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

set hlsearch

" spelling
set spell spelllang=en_us

" column highlight at 80
set colorcolumn=80

" store copy/paste in system clipboard
set clipboard=unnamed

" set paste mode
set pastetoggle=<F2>

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1
let NERDTreeShowHidden=1

let g:vim_markdown_folding_disabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set path=$PWD/**

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufReadPost *.MD set filetype=markdown

" set git commit line length to 72
au FileType gitcommit set tw=72

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
