" ==================================================
" Christian Roman - Vim config
" ==================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" ==================================================
" Plugin Management
" ==================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdTree'
Plugin 'ctrlp.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'php.vim'
Plugin 'terryma/vim-multiple-cursors'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

call vundle#end()            " required
filetype plugin indent on    " required

" ==================================================
" Powerline config
" ==================================================
set laststatus=2

" ==================================================
" Doxygen config
" ==================================================
let g:DoxygenToolkit_authorName="Christian Roman<ricanontherun@gmail.com>"

" ==================================================
" ctrlp config
" ==================================================
let g:ctrlp_working_path_mode = 0

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

set textwidth=120
set wrap!

" turn syntax highlighting on
set t_Co=256

syntax enable
colorscheme jellybeans 

" turn line numbers on
set number

" highlight matching braces
set showmatch

" ==================================================
" ctags extensions
" ==================================================
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/php

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" ==================================================
" Mappings
" ==================================================

" Putty conversions
:map <ESC>[A <Up>
:map <ESC>[B <Down>
:map <ESC>[C <Right>
:map <ESC>[D <Left>

:map <ESC>OA <C-Up>
:map <ESC>OB <C-Down>
:map <ESC>OC <C-Right>
:map <ESC>OD <C-Left>

:map <C-a> GVgg
:map <C-n> :enew
:map <C-o> :e . <Enter>
:map <C-s> :w <Enter>
:map <C-c> y
:map <C-v> p
:map <C-x> d
:map <C-z> u
:map <C-q> :q<Enter>
:map <C-Left> :tabprevious<CR>
:map <C-Right> :tabnext<CR>
:map <C-d> :Dox<Enter>
:map nt :NERDTree<Enter>:on<Enter>

" ==================================================
" Leaders
" ==================================================
:map <leader>v :tabe ~/.vimrc<Enter>

" Language specific configurations

" ==================================================
" PHP
" ==================================================
map <F5> :!php -l %<CR>

" Neat little function which will auto import the php class/trait under the cursor.
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

" Auto import the class under the cursor.
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
