" A VimRC
" Todd Hainsworth

" {{{ Setup
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
      set rtp+=/opt/homebrew/opt/fzf
  endif
endif
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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
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
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'xolox/vim-misc'
Plug 'ervandew/supertab'
Plug 'vim-vdebug/vdebug'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jreybert/vimagit'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
if has("unix")
    let g:uname = system("uname")
    if g:uname == "Darwin\n"
        Plug 'neovim/nvim-lspconfig'
        Plug 'simrat39/rust-tools.nvim'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-buffer'
    endif
endif
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
set completeopt=menuone,noinsert,noselect
set shortmess+=c

colorscheme minimalist

" Help syntax highlighting keep up with large JS or TS files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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

" Show current file path
nnoremap <leader>ff 1<C-G>

" Misc. Autocomplete stuff
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LanguageClient
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Vimagit
nnoremap <leader>mm :Magit<cr>

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

" Airline + Minimalist VimTheme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"

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

" ALE
let g:ale_pattern_options = {'\.php$': {'ale_enabled': 0}}
let g:ale_linters = {'rust': ['analyzer']}

" Neovim language client stuff
" LSP Setup
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set updatetime=300
        autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
        lua << EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF
" LSP Completion Setup
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
    endif
endif

" Fireplace
autocmd BufEnter *.clj nnoremap <leader>EE :%Eval<cr>
autocmd BufEnter *.clj nnoremap <leader>EP vap:Eval<cr>
autocmd BufEnter *.clj vnoremap <leader>EE :Eval<cr>

" }}}

" see exrc above
set secure
