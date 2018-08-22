" Use existing .vimrc and runtime
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" Setup -------------------------------------------------------------------;
let mapleader = "\\"

autocmd!
set nocompatible
set number

filetype off

" No plans to use Vim anywhere where this'd cause issues
set t_Co=256

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/NERDTree'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dikiaap/minimalist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

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

set nowrap                     " I hardly ever want to wrap code
set cursorline                 " Hilight the current line
set undofile                   " Keep track of undoable changes even after buffer closes
set undodir=~/.vim/undo        " Sane undo location
set vb                         " That annoying bell is no more!
set showcmd                    " Show incomplete command

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set shiftround
set relativenumber

set colorcolumn=140

colorscheme minimalist

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

" Remove gui elements
set guioptions-=mTrL

" Calls to external commands
nnoremap <leader>gg :!gedit %<cr>

" Plugin related ----------------------------------------------------------;
" Ack.vim
nnoremap <leader>/ :Ack 
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" FZF
set wildignore+=*/doc/*
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root() 

nnoremap <c-p> :ProjectFiles<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-t> :Tags<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" vendor/ ./'

" Fugitive
nnoremap <leader>gb :Gblame<cr>

" Commentary
nnoremap <leader>c<space> :Commentary<cr>
vnoremap <leader>c<space> :Commentary<cr>

" vim-jsx
let g:jsx_ext_required = 1

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>

" Go
" Shoosh Vim up until we get a new point release in the EPEL
let g:go_version_warning = 0
let g:go_fmt_autosave = 0

" Airline + Minimalist VimTheme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" Deocomplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Python debugging in Neovim
let $NVIM_PYTHON_LOG_FILE="./nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
