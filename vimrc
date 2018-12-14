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
Plug 'tpope/vim-eunuch'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'moll/vim-node'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim'
Plug 'universal-ctags/ctags'
Plug 'altercation/vim-colors-solarized'

call plug#end()

"--------------------------------------------------
" Basic setup
"--------------------------------------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set wrap!
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set t_Co=256
set exrc
set secure
set autoread
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
syntax enable
colorscheme solarized
set background=dark
set number
set showmatch
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set clipboard=unnamed

"--------------------------------------------------
" Plugin Specific Configuration
"--------------------------------------------------
set laststatus=2

let g:ale_linters = {'javascript': ['eslint']}

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

let g:indentLine_enabled = 1

let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

let g:vimwiki_list = [{'path': '~/Google Drive/Shared/notes'}]

let g:gutentags_ctags_extra_args=["--options=" . $HOME . "/.ctags"]
let g:airline_powerline_fonts=1

let NERDTreeShowHidden=1

" -------------------------------------------------
" Mappings
" -------------------------------------------------
:map <C-a> GVgg
:map <C-c> y
:map <C-v> p
:map <C-x> "_d
:map <C-z> u
:map <C-]> g<C-]>
:imap jj <Esc>
:imap <C-s> <Esc>:w<Enter>
:map <C-s> <Esc>:w<Enter>
:nmap riw viwp

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

" Tab Navigation
:map gj :tabprevious<Enter>
:map g; :tabnext<Enter>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

" Reload the current file as vimrc
:map <leader>r :so %<Enter>

" Tabs + Panes
:map <leader>vs	:vsplit<Enter>
:map <leader>hs	:split<Enter>
:map <leader>nt :tabe<Enter>
:map <leader>nf :tabe<Enter>:e

" Open ~/.vimrc
:map <leader>v :tabe ~/.vimrc<Enter>

" Searching
:map <leader>e :NERDTreeToggle <Enter>
:map <leader>f :NERDTreeFind<Enter>

" Open GFiles search
:map <leader>fs :GFiles<Enter>

" Open raw files search
:map <leader>fsr :Files<Enter>
:map <leader>fw /<C-r><C-w><Enter>
:map <leader>ts :Ag<Space><C-r><C-w><Enter>
:map <leader>tsr :Ag<Space>

" Fugitive
:map <leader>gs :Gstatus<Enter>
:map <leader>gd :Gsdiff<Enter>

" Tags
:map <leader>s :TagbarToggle<Enter>

" Format JSON using Python
:map <leader>fj :%!python -m json.tool<Enter>

" Duplicate line
:map <leader>dl <S-v>yp

"--------------------------------------------------
" Functions
"--------------------------------------------------
function! SetWikiOptions()
  setlocal wrap
  setlocal linebreak
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


"--------------------------------------------------
" Autocmd
"--------------------------------------------------
autocmd Filetype vimwiki call SetWikiOptions()
autocmd BufEnter,BufNew *.inc set syntax=PHP
