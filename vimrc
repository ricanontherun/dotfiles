" -------------------------------------------------
" Christian Roman - Vim config
" -------------------------------------------------

set nocompatible
filetype off

filetype plugin indent on    " required

set path=.

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

call plug#end()

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 2 spaces
set shiftwidth=4     " indent also with 2 spaces
set expandtab

set wrap!

" turn syntax highlighting on
set t_Co=256

" No highlighting bg color
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

" Color scheme
syntax enable
colorscheme jellybeans
set background=dark

" turn line numbers on
set number

" highlight matching braces
set showmatch

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"--------------------------------------------------
" Plugin Specific Configuration
"--------------------------------------------------
set laststatus=2

let g:ale_linters = {'javascript': ['eslint']}

" -------------------------------------------------
" Mappings
" -------------------------------------------------

:map <C-a>      GVgg
:map <C-s>      :w <Enter>
:map <C-c>      y
:map <C-v>      p
:map <C-x>      "_d
:map <C-z>      u
:imap <C-s>     <Esc><C-s>a
:map q	 	:q<Enter>
:map qa     :bufdo bd<Enter>

:map <C-]>      g<C-]>

" --------------------------------------------------
" Movement
" --------------------------------------------------

" Remapping the movement keys so I can stay on homerow as much as possible.
noremap ; l
noremap l k
noremap k j
noremap j h

" Split Navigation
:map g; <C-w>l
:map gl <C-w>k
:map gk <C-w>j
:map gj <C-w>h

" Pane resizing.
:map _ :vertical resize +5<Enter>
:map + :vertical resize -5<Enter>
:map - :resize +5<Enter>
:map = :resize -5<Enter>

" Tab Navigation
:map fj :tabprevious<Enter>
:map f; :tabnext<Enter>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

" Create vertical split
:map <leader>vs 	:vsplit<Enter>

" Create horiztonal split
:map <leader>hs 	:split<Enter>

" Open ~/.vimrc
:map <leader>v      :tabe ~/.vimrc<Enter>

" Open the file explorer.
:map <leader>e      :NERDTreeToggle <Enter>

" New tab
:map <leader>nt     :tabe<Enter>

" New file
:map <leader>nf     :tabe<Enter>:e

" Open zfz search pane
:map <leader>s    :GFiles<Enter>
