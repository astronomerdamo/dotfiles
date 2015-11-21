" define plugins
call plug#begin()
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
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'},
      \ 'component_visible_condition': {'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'}
      \ }

" turn on syntax
syntax on

" allow hidden buffers
set hidden

" show matching brackets, quotes
set showmatch

" append wrapped lines with clear sign
set showbreak=+++

" don't wrap lines
set nowrap

" show the cursor position at all times
set ruler

" turn line number on with relative line numbers from cursor
set number
set relativenumber

" open splits to the right and below of current view
set splitbelow
set splitright

" remap split navigations (left, down, up, right)
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" remap terminal insert to normal mode
tnoremap <Esc> <C-\><C-n>

" remap split navigation from terminal (left, down, up, right)
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

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

" remove searched word highlighting
nnoremap <leader>noh :noh<CR>

" set list characters for viewing whitespace
" and toggle on/off with leader-w
set listchars+=eol:$,space:.
nnoremap <leader>w :set list!<CR>

" set colorscheme
colorscheme Tomorrow-Night
"set background=dark

