" Setup -------------------------------------------------------------------;
let mapleader = "\\"

autocmd!
set nocompatible
filetype off

" No plans to use Vim anywhere where this'd cause issues
set t_Co=256

" Plugin -------------------------------------------------------------------;
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/NERDTree'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dikiaap/minimalist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rust-lang/rust.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/vim-after-object'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/ncm-phpactor'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
call plug#end()

filetype plugin indent on
syntax enable
syntax sync fromstart

" Setting -----------------------------------------------------------------;
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

" Whitespace
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set shiftround
set colorcolumn=140
set tags=.tags
" Beautiful
colorscheme minimalist

" Keymap -----------------------------------------------------------------;
" Move sanely
map j gj
map k gk

" Avoid typos
nmap ; :

" I prefer `B` and `E` to go to the beginning and end of lines
map B ^
map E $

nnoremap <leader>hl :noh<cr>   " Disable search hilighting

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
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

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

" Show current file path
nnoremap <leader>ff 1<C-G>

" Remove gui elements
set guioptions-=mTrL

" Until I can be bothered to work out copy-paste with the system clipboard...
nnoremap <leader>gg :!gedit %<cr>

" Plugin related ----------------------------------------------------------;
" Ack.vim
nnoremap <leader>/ :Ack 
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" FZF and misc file finding
set wildignore+=*/doc/*
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-t> :Tags<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-c> :Commits<cr>
nnoremap <c-C> :BCommits<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" ./' " Use AG for searching and makes ure to include 'vendor/' in that search

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

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_addtags_transform = "snakecase"

" Airline + Minimalist VimTheme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Gutentags
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_ctags_tagfile = ".tags"
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", "var", "pub/static", "generated", ".git", "node_modules", "*.vim/bundle/*"]

" NCM
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" PHPactor
let g:phpactorPhpBin = "/opt/rh/rh-php70/root/usr/bin/php"
let g:phpactorOmniError = v:true
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" Rust
let g:rustfmt_autosave = 1

" Language Server
let g:LanguageClient_settingsPath = "/home/todd/.vim/settings.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=/Users/todd/.cargo/bin/rls', 'rls'],
    \ 'python': ['pyls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
