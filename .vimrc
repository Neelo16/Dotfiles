" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'lervag/vimtex'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'raimondi/delimitmate'
Plugin 'mhinz/vim-startify'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sjl/gundo.vim'
Plugin 'gregsexton/gitv'
Plugin 'davidhalter/jedi-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'godlygeek/tabular'

" Colorschemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'sickill/vim-monokai'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" allow backspacing over everything in insert mode

set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
  autocmd InsertEnter * :call AbsNum()
  autocmd InsertLeave * :call RelNum()

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set rnu " Relative line numbers

function! RelNum()
	set nonumber
	set rnu
endfunction

function! AbsNum()
	set nornu
	set number
endfunction

set clipboard=unnamedplus
set backupdir=~/.vim-backup,/tmp
set undodir=~/.vim-backup,/tmp
set directory=~/.vim-backup,/tmp
set wildmenu

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
let g:syntastic_tex_checkers = ['chktex']

let g:vimtex_view_method = 'zathura'

let mapleader = " "
map <Leader>b :NERDTreeToggle<CR>
map <Leader>n :noh<CR>:SyntasticReset<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>u :GundoToggle<CR>

" Highlight lines longer than 80 characters
"match ErrorMsg '\%>80v.\+'

set complete+=kspell
set expandtab
set ts=4
set sw=4

set laststatus=2
let g:airline_powerline_fonts = 1

let g:molokai_original = 1
let g:rehash256 = 1

" Make CtrlP appear at the top of the screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

" Use ag to speed up CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Disable automatic concealment of certain tags in TeX
" let g:tex_conceal=''

set t_ut=

" Map Ctrl+movement keys to window movements
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

let delimitMate_expand_cr = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']
au FileType python let b:delimitMate_expand_inside_quotes = 1

" Add ability to use % to jump between matching HTML tags
runtime macros/matchit.vim

" Binding to skip to the end of the next XML/HTML tag
map gt f>

let g:jedi#usages_command = "<leader>c"

colorscheme molokai
