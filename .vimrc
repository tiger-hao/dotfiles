set background=dark
set number
highlight LineNr ctermfg=darkgrey

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohlsearch<CR>

set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set laststatus=2
set wildmenu
set ruler
set nowrap
set hidden

syntax on
filetype plugin indent on

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | wincmd p | execute 'cd '.argv()[0] | endif
