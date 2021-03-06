" A VimRC
" Todd Hainsworth

" {{{ Setup
let mapleader = "\\"

autocmd!
set nocompatible
filetype off

" No plans to use Vim anywhere where this'd cause issues
set t_Co=256
" }}}
" {{{ Plugin
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/NERDTree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dikiaap/minimalist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'StanAngeloff/php.vim'
Plug 'roxma/nvim-yarp'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'jparise/vim-graphql'
Plug 'xolox/vim-misc'
Plug 'ervandew/supertab'
Plug 'vim-vdebug/vdebug'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
call plug#end()
" }}}
" {{{ Settings
filetype plugin indent on
syntax enable
syntax sync fromstart

set mouse=a
set nowrap                     " I hardly ever want to wrap code
set cursorline                 " Hilight the current line
set undofile                   " Keep track of undoable changes even after buffer closes
set undodir=~/.vim/undo        " Sane undo location
set vb                         " That annoying bell is no more!
set showcmd                    " Show incomplete command
set number
set relativenumber
set exrc

" Remove gui elements
set guioptions-=mTrL

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set shiftround
set colorcolumn=140
set tags=.tags
colorscheme minimalist
" }}}
" {{{ Folding
set foldmethod=marker
nnoremap <space> za
" }}}
" {{{ Keymap
" Move sanely
map j gj
map k gk

" Avoid typos
nmap ; :

" I prefer `B` and `E` to go to the beginning and end of lines
map B ^
map E $

" Disable search hilighting
nnoremap <leader>hl :noh<cr> 

" Centered search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Slightly more magic searching
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Please stop...
map <F1> <Esc>
imap <F1> <Esc>

" No arrow keys --- force yourself to use the home row
nmap <up> <nop>
nmap <down> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Switch buffers with arrows instead
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" Toggle between buffers with "\\"
nnoremap <leader><leader> <c-^>

" Switching between splits
nnoremap <leader>we <C-w>l
nnoremap <leader>wq <C-w>h
nnoremap <leader>ww <C-w>k
nnoremap <leader>ws <C-w>j

nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>ss :split<cr>

" Easily get back here
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Easier exit
inoremap jj <esc>

" Leader+a to close other splits
nnoremap <leader>o :only<cr>

" Show current file path
nnoremap <leader>ff 1<C-G>

" Open the current file in a new tab
nnoremap <leader>zz :tabedit %<cr>
nnoremap <leader>ZZ :tabclose<cr>

" Misc. Autocomplete stuff
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LanguageClient
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" }}}
" {{{ Plugin related
" FZF and misc file finding
set wildignore+=*/doc/*
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-t> :Tags<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-c> :Commits<cr>
nnoremap <c-C> :BCommits<cr>
if filereadable("vendor/")
  let $FZF_DEFAULT_COMMAND = 'ag -g "" -U vendor/ ./' " Use AG for searching and makes ure to include 'vendor/' in that search
else
  let $FZF_DEFAULT_COMMAND = 'ag -g "" -U ./' " Use AG for searching and makes ure to include 'vendor/' in that search
endif

" Fugitive
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>

" Commentary
nnoremap <leader>c<space> :Commentary<cr>
vnoremap <leader>c<space> :Commentary<cr>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>

" Ack.vim
nnoremap <leader>/ :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Go
" Shoosh Vim up until we get a new point release in the EPEL
let g:go_version_warning=0

let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"

let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
let g:go_addtags_transform="snakecase"

" Airline + Minimalist VimTheme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"

" HDevTools
au FileType haskell nnoremap <buffer> <leader>tt :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <leader>tc <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <leader>ti :HdevtoolsInfo<CR>

" Format JSON
nnoremap <leader>js %!python -m json.tool<cr>

" Rust
let g:rustfmt_autosave = 1

" Language Server/Client
let g:LanguageClient_autoStart=1
let g:LanguageClient_signColumnAlwaysOn = 1
let g:LanguageClient_settingsPath = "/home/todd/.vim/settings.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=/Users/todd/.cargo/bin/rls', 'rls'],
    \ 'python': ['pyls'],
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ALE
let g:ale_pattern_options = {'\.php$': {'ale_enabled': 0}}

" }}}

" see exrc above
set secure
