call plug#begin()
Plug 'sonph/onehalf', { 'rtp': 'vim' }
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

Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
" Plug 'jparise/vim-graphql'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
call plug#end()

syntax on
filetype plugin indent on
set number
set hidden
set splitright

set path=$PWD/**
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd FileType eruby,javascript,javascriptreact,json,ruby,typescript,typescriptreact,vim setlocal shiftwidth=2 tabstop=2

let mapleader=','
nnoremap <leader>q :copen<CR>
nnoremap <leader>l :lopen<CR>

set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set wildmenu
set nowrap

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-h> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | wincmd p | execute 'cd '.argv()[0] | endif

colorscheme onehalfdark
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let $FZF_DEFAULT_COMMAND='rg --hidden --files -g "!.git"'
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>": '').":FZF\<CR>"
nnoremap <silent> <expr> <C-f> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>": '').":Rg\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>er :CocDiagnostics<CR>
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
let g:coc_disable_transparent_cursor=1
let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-html', 'coc-json', 'coc-python', 'coc-tsserver']

let g:python_highlight_all = 1
let g:closetag_filetypes = 'html,xhtml,phtml,javascriptreact,typescriptreact'
let g:closetag_close_shortcut = '<leader>>'

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
