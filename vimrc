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
Plugin 'craigemery/vim-autotag'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-grepper'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'

" PHP Plugins
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'

call vundle#end()            " required
filetype plugin indent on    " required

" Doxygen
let g:DoxygenToolkit_briefTag_pre=""

" I want airline to always be displayed.
set laststatus=2
let g:airline_powerline_fonts=1

" Ctrl P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 0
let g:ctrlp_max_files=0

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Close tagbar as soon as jump is made.
let g:tagbar_autoclose=1 

" Syntastic Settings
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
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces

set textwidth=120
set wrap!

" turn syntax highlighting on
set t_Co=256

" Color scheme
syntax enable
colorscheme jellybeans 

" turn line numbers on
set number

" highlight matching braces
set showmatch

autocmd FileType c,h,cpp,hpp,js,php,html,vue,vimrc autocmd BufWritePre <buffer> StripWhitespace

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Allow for project specific vimrc files
set exrc

" -------------------------------------------------
" Mappings
" -------------------------------------------------

:map <C-a>      GVgg
:map <C-s>      :w <Enter>
:map <C-c>      y
:map <C-v>      p
:map <C-x>      d
:map <C-z>      u
:map <C-d>      :Dox<Enter>
:imap <C-s>     <Esc><C-s>a
:map q          :q<Enter>
:map qa         :qa<Enter>
:map fq         :q!<Enter>
:map fqa        :qa!<Enter>

" Ctags
:map g]         <C-w>g]

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

" Tab Navigation
:map fj :tabprevious<Enter>
:map f; :tabnext<Enter>

" Grep the project for the term under the cursor.
:map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

" Fugitive leaders
:map <leader>ga     :Git add %<Enter>
:map <leader>gaa    :Git add --all<Enter>
:map <leader>gs     :Git status<Enter>
:map <leader>gd     :Git diff<Enter>
:map <leader>gc     :Git commit<Enter>
:map <leader>gg     :Git pull<Enter>
:map <leader>ggm    :Git pull origin master<Enter>
:map <leader>gp     :Git push<Enter>

:map <leader>l      :TagbarToggle<CR>
:map <leader>e      :NERDTreeToggle <Enter>

nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
let g:grepper = {
    \ 'tools': ['ack'],
    \ 'ack': {
    \   'grepprg':    'ack --nocolor --ignore-dir={.git,node_modules,storage,public,build} --ignore-file=is:.tags',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
\ }}

:map <leader>v      :tabe ~/.vimrc<Enter>
:map <leader>tw     <C-w><S-t>
:map <leader>qa     :qa!<Enter>
:map <leader>nt     :tabe<Enter>
:map <leader>nf     :tabe<Enter>:e

" [Un]Comment the select lines.
:map <leader>c      :s/^/\/\/<enter>
:map <leader>uc     :s/\/\//<enter>
