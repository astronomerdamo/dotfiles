" use vim defaults
set nocompatible

" define plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" themes
Plug 'altercation/vim-colors-solarized'
Plug 'Zenburn'
call plug#end()

" set lightline appearance
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized_light',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'},
      \ 'component_visible_condition': {'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'}
      \ }


" turn syntax on
syntax on

" set encoding
set encoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow hidden buffers
set hidden

" show matching braces, quotes
set showmatch

" append wrapped lines with clear sign
set showbreak=+++

" don't wrap lines
set nowrap

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" keep 500 lines of command line history
set history=500

" keep 500 undo levels
set undolevels=500

" show the cursor position all the time
set ruler

" always show two lines above an below cursor
set scrolloff=2

" allow mouse movement and selection
set mouse=a

" turn line number on with relative line numbers from cursor
set number
set relativenumber

" make search highlight all matchesi and incremental search
set hlsearch
set incsearch

" open splits to the right and below of current view
set splitbelow
set splitright

" remap page navigation to be consistent with j/k
"nnoremap <S-K> <S-H>
"nnoremap <S-J> <S-L>

" cycle through buffers easily
"nnoremap <S-L> :bnext<CR>
"nnoremap <S-H> :bprevious<CR>

" set leader key to space
let mapleader = "\<space>"

" remap split navigations (left, down, up, right)
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" window splitting using leader
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v

" window closures using leader
nnoremap <leader>c <C-w>c
nnoremap <leader>o <C-w>o

" remove searched word highlighting
nnoremap <leader>nh :noh<CR>

" Use leader for common CtrlP plugin commands
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" NERDtree options
nnoremap <leader>nt :NERDTreeToggle<CR>

" Flake8 my python
nnoremap <leader>f8 :call Flake8()<CR>

" set easy access to ag
nnoremap <leader>ag :Ag 
let g:ag_working_path_mode='r'

" enable code folding
set foldmethod=indent
set foldlevel=99

" set list characters for viewing whitespace
" and toggle on/off with leader-w
set listchars+=eol:$,space:.
nnoremap <leader>w :set list!<CR>

" language indent overrides
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

" force markdown hilighting on *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set the colorscheme
colorscheme solarized
set background=light

