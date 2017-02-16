" -------------------------------------------------
" Christian Roman - Vim config
" -------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" -------------------------------------------------
" Plugin Management
" -------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdTree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'DoxygenToolkit.vim'
Plugin 'raimondi/delimitmate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'valloric/youcompleteme'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()            " required
filetype plugin indent on    " required

let g:DoxygenToolkit_briefTag_pre=""

" I want airline to always be displayed.
set laststatus=2

let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 1
let g:ctrlp_max_files=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
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

autocmd FileType c,h,cpp,hpp,js,php,html,vue,vimrc autocmd BufWritePre <buffer> StripWhitespace

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" -------------------------------------------------
" Mappings
" -------------------------------------------------

:map <C-a>          GVgg
:map <C-o>          :e . <Enter>
:map <C-s>          :w <Enter>
:map <C-c>          y
:map <C-v>          p
:map <C-x>          d
:map <C-z>          u
:map <C-d>          :Dox<Enter>
:imap <C-s>         <Esc><C-s>a

:map <Left>          :tabprevious<CR>
:map <Right>         :tabnext<CR>

" Tag navigation
:map g]             <C-w>g]

" Movement.
noremap ; l
noremap l k
noremap k j
noremap j h

:map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

:map <leader>v      :tabe ~/.vimrc<Enter>

:map <leader>nt     :tabe<Enter><C-p>
:map <leader>nf     :tabe<Enter>:e
:map <leader>tw     <C-w><S-t>

:map <leader>q      :q!<Enter>
:map <leader>qa     :qa!<Enter>

:map <leader>k      :NERDTree<Enter><C-w>o

:map <leader>l      :TagbarToggle<CR>

:map <leader>t      :!ctags %<Enter>A

" [Un]Comment the select lines.
:map <leader>c      :s/^/\/\/<enter>
:map <leader>uc     :s/\/\//<enter>
