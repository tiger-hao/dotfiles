syntax enable
set background=dark
colorscheme solarized
set number

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd FileType eruby,json,ruby,typescriptreact,vim setlocal shiftwidth=2 tabstop=2

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

filetype plugin indent on

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | wincmd p | execute 'cd '.argv()[0] | endif

let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>": '').":FZF\<CR>"
nnoremap <silent> <expr> <C-f> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>": '').":Rg\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
let g:coc_disable_transparent_cursor=1
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-python', 'coc-tsserver']
