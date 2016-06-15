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
Plugin 'ctrlp.vim'
Plugin 'php.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/indentLine'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'c9s/phpunit.vim'
Plugin 'majutsushi/tagbar'
Plugin 'DoxygenToolkit.vim'
Plugin 'raimondi/delimitmate'

call vundle#end()            " required
filetype plugin indent on    " required

let g:DoxygenToolkit_briefTag_pre=""

" -------------------------------------------------
" Powerline config
" -------------------------------------------------
set laststatus=2

" -------------------------------------------------
" ctrlp config
" -------------------------------------------------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 1

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

autocmd FileType c,h,cpp,hpp,js,php,html,vue,.vimrc autocmd BufWritePre <buffer> StripWhitespace

" -------------------------------------------------
" ctags extensions
" -------------------------------------------------

"Store tmp files in /var/tmp, thanks http://stackoverflow.com/a/4331812"
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" -------------------------------------------------
" Mappings
" -------------------------------------------------

:map <C-a>          GVgg
:map <C-n>          :enew
:map <C-o>          :e . <Enter>
:map <C-s>          :w <Enter>
:map <C-c>          y
:map <C-v>          p
:map <C-x>          d
:map <C-z>          u
:map <C-d>          :Dox<Enter>
:imap <C-s>         <Esc><C-s>a

:map <S-t>          :tabprevious<CR>
:map <S-y>          :tabnext<CR>

:map g]             <C-w>g]

:map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" -------------------------------------------------
" Leaders
" -------------------------------------------------
:map <leader>v      :tabe ~/.vimrc<Enter>
:map <leader>nt     :tabe<Enter><C-p>
:map <leader>tw     <C-w><S-t>
:map <leader>q      :q<Enter>
:map <leader>k      :tabe<Enter>:NERDTree<Enter><C-w>o
:map <leader>l      :TagbarToggle<CR>

" Fugitive
:map <leader>gs     :Git status<Enter>
:map <leader>gaa    :Git add --all<Enter>
:map <leader>ga     :Git add %<Enter>
:map <leader>gc     :Git commit<Enter>
:map <leader>gp     :Git push<Enter>
:map <leader>gg     :Git pull<Enter>
:map <leader>gd     :Git diff %<Enter>
:map <leader>gda    :Git diff<Enter>
:map <leader>gu     :Git checkout %<Enter>
:map <leader>gua    :Git checkout *<Enter>

" -------------------------------------------------
" PHP
" -------------------------------------------------
map <F6>            :!php -l %<CR>

" Neat little function which will auto import the php class/trait under the cursor.
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

" Auto import the class under the cursor.
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
