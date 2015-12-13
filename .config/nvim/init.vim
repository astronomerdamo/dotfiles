" define plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" themes
Plug 'altercation/vim-colors-solarized'
Plug 'Zenburn'
call plug#end()

" set lightline appearance
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
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

" always show two lines above an below cursor
set scrolloff=2

" turn line number on with relative line numbers from cursor
set number
set relativenumber

" open splits to the right and below of current view
set splitbelow
set splitright

" remap terminal insert to normal mode
tnoremap <Esc> <C-\><C-n>

" remap page navigation to be consistent with j/k
nnoremap <S-K> <S-H>
nnoremap <S-J> <S-L>

" cycle through buffers easily
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprevious<CR>

" set leader key to space
let mapleader = "\<space>"

" remap split navigations (left, down, up, right)
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" buffer options using leader
nnoremap <leader>bd :bd<CR>
nnoremap <leader>ls :ls<CR>

" window splitting using leader
nnoremap <leader>s <C-W>s
nnoremap <leader>v <C-W>v

" window closures using leader
nnoremap <leader>c <C-W>c
nnoremap <leader>o <C-W>o

" remove searched word highlighting
nnoremap <leader>nh :noh<CR>

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

" force markdown hilighting on *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set colorscheme
colorscheme solarized
set background=dark

