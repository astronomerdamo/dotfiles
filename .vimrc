" use vim defaults
set nocompatible

" define plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" themes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'Zenburn'
call plug#end()

" set lightline appearance
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'},
      \ 'component_visible_condition': {'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'}
      \ }

" NERDtree options
nnoremap <C-n> :NERDTreeToggle<CR>

" language indent overrides
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

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

" remap split navigations (left, down, up, right)
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" remap page navigation to be consistent with j/k
nnoremap <S-K> <S-H>
nnoremap <S-J> <S-L>

" cycle through buffers easily
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprevious<CR>

" set leader key to space
let mapleader = "\<space>"

" buffer options using leader
nnoremap <leader>bd :bd<CR>
nnoremap <leader>ls :ls<CR>

" window closures using leader
nnoremap <leader>c <C-W>c
nnoremap <leader>o <C-W>o

" enable code folding
set foldlevel=99

" set list characters for viewing whitespace
" and toggle on/off with leader-w
set listchars+=eol:$,space:.
nnoremap <leader>w :set list!<CR>

" force markdown hilighting on *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set the colorscheme
colorscheme Tomorrow-Night
"set background=dark
"if has('gui_running')
"  colorscheme solarized
"  set background=dark
"else
"  colorscheme monokai
"  "set background=dark
"endif
