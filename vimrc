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
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'

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
set expandtab
set shiftwidth=2
set softtabstop=2

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

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

let g:indent_guides_enable_on_vim_startup = 1

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

" Reload the current file as vimrc
:map <leader>r        :so %<Enter>

" Create vertical split
:map <leader>vs 	:vsplit<Enter>

" Create horiztonal split
:map <leader>hs 	:split<Enter>

" Open ~/.vimrc
:map <leader>v      :e ~/.vimrc<Enter>

" Open the file explorer.
:map <leader>e      :NERDTreeToggle <Enter>
:map <leader>f      :NERDTreeFind<Enter>

" New tab
:map <leader>nt     :tabe<Enter>

" New file
:map <leader>nf     :tabe<Enter>:e

" Open zfz search pane
:map <leader>fs    :call OpenFileSearch()<Enter>
:map <leader>ts    :Ag<Enter>

" Fugitive
:map <leader>gs     :Gstatus<Enter>
:map <leader>gd     :Gsdiff<Enter>

"--------------------------------------------------
" Functions
"--------------------------------------------------

" Open the file search pane, will exclude .gitignore stuff if .git exists.
function! OpenFileSearch()
  if isdirectory('./git')
    let fn = 'GFiles'
  else
    let fn = 'Files'
  endif

  execute fn
endfunction
