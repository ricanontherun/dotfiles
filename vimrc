" -------------------------------------------------
" Christian Roman - Vim config
" -------------------------------------------------

set nocompatible
filetype off

filetype plugin indent on    " required

set path=.

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent

" configure tabwidth and insert spaces instead of tabs
set expandtab
set shiftwidth=2
set softtabstop=2

set wrap!

"if has("gui_macvim")
  "set macligatures
"endif

" using Fira Code
set guifont=Source\ Code\ Pro:h14

" turn syntax highlighting on
set t_Co=256

set exrc
set secure
set autoread

" No highlighting bg color
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

" Color scheme
syntax enable
colorscheme solarized
set background=dark

" turn line numbers on
set number

" highlight matching braces
set showmatch

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set clipboard=unnamed

"--------------------------------------------------
" Plugin Specific Configuration
"--------------------------------------------------
set laststatus=2

let g:ale_linters = {'javascript': ['eslint']}

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1

let NERDTreeShowHidden=1

set completeopt-=preview
let g:loaded_youcompleteme = 1

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
:map qa         :bufdo bd<Enter>
:imap jj        <Esc>

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
:map f; <C-w>l
:map fl <C-w>k
:map fk <C-w>j
:map fj <C-w>h

" Pane resizing.
":map _ :vertical resize +5<Enter>
":map + :vertical resize -5<Enter>
":map - :resize +5<Enter>
":map = :resize -5<Enter>

" Tab Navigation
:map gj :tabprevious<Enter>
:map g; :tabnext<Enter>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

" Reload the current file as vimrc
:map <leader>r        :so %<Enter>

" panes + tabs
:map <leader>vs 	:vsplit<Enter>
:map <leader>hs 	:split<Enter>
:map <leader>e      :NERDTreeToggle <Enter>
:map <leader>f      :NERDTreeFind<Enter>
:map <leader>nt     :tabe<Enter>
:map <leader>nf     :tabe<Enter>:e

" Open ~/.vimrc
:map <leader>v      :e ~/.vimrc<Enter>

" Searching
:map <leader>fs    :GFiles<Enter>
:map <leader>fsr   :Files<Enter>
:map <leader>ts     :Ag<Space><C-r><C-w><Enter>
:map <leader>tsr    :Ag<Space>

" Fugitive
:map <leader>gs     :Gstatus<Enter>
:map <leader>gd     :Gsdiff<Enter>

" Tags
:map <leader>s      :TagbarToggle<Enter>

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

"--------------------------------------------------
" Commands Overrides
"--------------------------------------------------
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   '--path-to-ignore ~/.ignore --hidden',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Status barl
:set statusline+=%F
