" define plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

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

" remap split navigations (up, down, left, right)
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

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

" cancel terminal mode with ,escape
"tnoremap ,<ESC> <C-\><C-n>

" set list characters for viewing whitespace
" and toggle on/off with leader-w
set listchars+=eol:$,space:.
nnoremap <leader>w :set list!<CR>

" set colorscheme
colorscheme monokai
"set background=dark

