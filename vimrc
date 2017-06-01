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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitmate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'valloric/youcompleteme'
Plugin 'rdnetto/YCM-Generator'
Plugin 'craigemery/vim-autotag'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'

" Work related plugins
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'posva/vim-vue'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2

set statusline=%{fugitive#statusline()}
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr

" Ctrl P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 0
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_regexp = 1

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Close tagbar as soon as jump is made.
let g:tagbar_autoclose=1 

let g:indent_guides_enable_on_vim_startup = 1

autocmd FileType vue syntax sync fromstart

set tags=tags
set path=.

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

set noeol

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

autocmd FileType c,h,cpp,hpp,js,php,html,vue,vimrc,scss,go,lisp autocmd BufWritePre <buffer> StripWhitespace

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
:map <C-x>      "_d
:map <C-z>      u
:imap <C-s>     <Esc><C-s>a

" Ctags
:map <C-]>         g<C-]>

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

:map _ :vertical resize +5<Enter>
:map + :vertical resize -5<Enter>

:map - :resize +5<Enter>
:map = :resize -5<Enter>

" Tab Navigation
:map fj :tabprevious<Enter>
:map f; :tabnext<Enter>

" Grep the project for the term under the cursor.
:map <F4>	:Ack --nocolor --ignore-file=is:tags --ignore-dir={.git,vendor} <cword> . <Enter>

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
:map <leader>gu     :Git checkout %<Enter>
:map <leader>ggm    :Git pull origin master<Enter>
:map <leader>gp     :Git push<Enter>

:map <leader>l      :TagbarToggle<CR>
:map <leader>e      :NERDTreeToggle <Enter>
:map <leader>q	 		:q<Enter>
:map <leader>qa     	:bufdo bd<Enter>

:map <leader>mt     :!ctags -R .<Enter>
:map <leader>at     :!ctags -a %<Enter>

:map <leader>vs 		:vsplit<Enter>
:map <leader>hs 		:split<Enter>

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
:map <leader>nt     :tabe<Enter>
:map <leader>nf     :tabe<Enter>:e

" [Un]Comment the select lines.
:map <leader>c      :s/^/\/\/<enter>
:map <leader>uc     :s/\/\//<enter>
