" Setup -------------------------------------------------------------------;
let mapleader = "\\"

autocmd!
set nocompatible
set number

filetype off

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
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/NERDTree'
Plugin 'fatih/vim-go'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
call vundle#end()

filetype plugin indent on
syntax enable
syntax sync fromstart

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
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set shiftround
set relativenumber

set colorcolumn=140

if has("gui_running")
  colorscheme desert
else
  colorscheme delek
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

" FZF
set wildignore+=*/doc/*
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root() 

nnoremap <c-p> :ProjectFiles<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Fugitive
nnoremap <leader>gb :Gblame<cr>

" Commentary
nnoremap <leader>c<space> :Commentary<cr>
vnoremap <leader>c<space> :Commentary<cr>

" vim-jsx
let g:jsx_ext_required = 1

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Go
" Shoosh Vim up until we get a new point release in the EPEL
let g:go_version_warning = 0
let g:go_fmt_autosave = 0
