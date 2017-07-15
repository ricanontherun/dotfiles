" -------------------------------------------------
" Christian Roman - Vim config
" -------------------------------------------------

set nocompatible
filetype off

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
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" PHPInsertUse
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php inoremap <leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <leader>u :call PhpInsertUse()<CR>

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

" Automatically strip whitespace on buffer save.
autocmd FileType c,h,cpp,hpp,javascript,php,html,vue,vimrc,scss,go,lisp autocmd BufWritePre <buffer> StripWhitespace

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

" Ack a provided file for the <cword>
:map <F3>	:Ack! --nocolor --ignore-dir={.git,vendor,node_modules,storage,public,build} --ignore-file=is:tags <cword>

" -------------------------------------------------
" Leaders
" -------------------------------------------------

" Fugitive leaders

" Add the current file
:map <leader>ga     :Git add %<Enter>

" Add all modified files
:map <leader>gaa    :Git add --all<Enter>

" Print the git status
:map <leader>gs     :Git status<Enter>

" Print the diff of all modified files
:map <leader>gd     :Git diff<Enter>

" Print the diff of the current file
:map <leader>gdf    :Git diff %<Enter>

" Open the git commit prompt
:map <leader>gc     :Git commit<Enter>

" Commit changes with a given message
:map <leader>gcm    :Git commit -m

" Git pull
:map <leader>gg     :Git pull<Enter>

" Git pull from master
:map <leader>ggm    :Git pull origin master<Enter>

" Checkout the current file
:map <leader>gu     :Git checkout %<Enter>

" Git push
:map <leader>gp     :Git push<Enter>

" Remove the current file
:map <leader>grm    :Git rm %<Enter>

" Git reset
:map <leader>gr     :Git reset<Enter>

:map <leader>l      :TagbarToggle<CR>

:map <leader>e      :NERDTreeToggle <Enter>
:map <leader>ef     :NERDTreeFind<Enter>

" Create the tags file starting in current working directory.
:map <leader>mt     :!ctags .<Enter>

" Append this files tags to the main tags file.
:map <leader>at     :!ctags -a %<Enter>

" Split leaders
:map <leader>vs 	:vsplit<Enter>
:map <leader>hs 	:split<Enter>

" Open ~/.vimrc
:map <leader>v      :tabe ~/.vimrc<Enter>

" New tab
:map <leader>nt     :tabe<Enter>

" New file
:map <leader>nf     :tabe<Enter>:e

" [Un]comment the select lines.
:map <leader>c      :s/^/\/\/<enter>
:map <leader>uc     :s/\/\//<enter>
:map <leader>fw     /<c-r><c-w><enter>
