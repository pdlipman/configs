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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'suan/vim-instant-markdown'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent on  " required!

set expandtab
set tabstop=4
set shiftwidth=4

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

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

set hlsearch

" vim-markdown
let g:vim_markdown_folding_disabled=1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" spelling
set spell spelllang=en_us

" column highlight at 80
set colorcolumn=80

" store copy/paste in system clipboard
set clipboard=unnamed

" set paste mode
set pastetoggle=<F2>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_javascript_checkers = ['eslint']

set path=$PWD/**

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
