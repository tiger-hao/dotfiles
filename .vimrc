syntax enable
set background=dark
colorscheme solarized
set number

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd FileType ruby,eruby,typescriptreact setlocal shiftwidth=2 tabstop=2

let mapleader=','
nnoremap <leader>q :copen<CR>
nnoremap <leader>l :lopen<CR>

set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohlsearch<CR>

set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set wildmenu
set nowrap

set hidden
set splitright

set path=$PWD/**
set backspace=indent,eol,start
set completeopt=menuone

filetype plugin indent on

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | wincmd p | execute 'cd '.argv()[0] | endif

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>go :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>re :YcmCompleter GoToReferences<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gdo :YcmCompleter GetDoc<CR>
nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>er :YcmDiags<CR>
