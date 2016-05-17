" Christian Roman - vim cofig

" disable vi compatibility (emulation of old bugs)
set nocompatible

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="Christian Roman<ricanontherun@gmail.com>"

execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim

" ctrlp.vim will only operate in the current working directory.
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

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120

" turn syntax highlighting on
set t_Co=256
syntax enable
colorscheme darcula 

" turn line numbers on
set number

" highlight matching braces
set showmatch

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Putty specific mappings.
:map <ESC>OA <C-Up>
:map <ESC>OB <C-Down>
:map <ESC>OC <C-Right>
:map <ESC>OD <C-Left>

" Mappings
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

" Language specific configurations

" PHP
map <F5> :!php -l %<CR>

