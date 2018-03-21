" Setup -------------------------------------------------------------------;
let mapleader = "\\"

autocmd!
set nocompatible
set number

filetype off
syntax enable
syntax sync fromstart

" No plans to use Vim anywhere where this'd cause issues
set t_Co=256

" Vundle ------------------------------------------------------------------;
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
call vundle#end()

filetype plugin indent on

" General -----------------------------------------------------------------;

"Move sanely
map j gj
map k gk

" Avoid typos
nmap ; :

" I prefer `B` and `E` to go to the beginning and end of lines
map B ^
map E $

nnoremap <leader>hl :noh<cr>   " Disable search hilighting
set mouse=a

" Bits and pieces to make things `sane-ish`
set wildmenu                   " Mode-line completion
set nowrap                     " I hardly ever want to wrap code
set cursorline                 " Hilight the current line
set undofile                   " Keep track of undoable changes even after buffer closes
set undodir=~/.vim/undo
set vb                         " That annoying bell is no more!
set showcmd                    " Show incomplete command
set backspace=indent,eol,start " Backspace all the things

" Searching
set hlsearch                   " Hilight while searching
set incsearch                  " Incremental searching

" Whitespace
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set shiftround

set colorcolumn=110

if has("gui_running")
  colorscheme desert
else
  colorscheme default
endif

" Switching between splits
nnoremap <leader>we <C-w>l
nnoremap <leader>wq <C-w>h
nnoremap <leader>ww <C-w>k
nnoremap <leader>ws <C-w>j

" Easily get back here
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Easier exit
inoremap jj <esc>

" Show current file path
nnoremap <leader>ff 1<C-G>

" Plugin related ----------------------------------------------------------;
" Ack.vim
nnoremap <leader>/ :Ack 

" CtrlP
set wildignore+=*/doc/*
let g:ctrlp_max_files=10000

" Fugitive
nnoremap <leader>gb :Gblame<cr>

" Commentary
nnoremap <leader>c<space> :Commentary<cr>
vnoremap <leader>c<space> :Commentary<cr>
