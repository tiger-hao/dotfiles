set background=dark
set number
highlight LineNr ctermfg=darkgrey

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

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
