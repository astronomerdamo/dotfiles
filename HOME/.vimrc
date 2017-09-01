" use vim defaults
set nocompatible

" define plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'w0rp/ale', { 'for': 'python' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" themes
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-two-firewatch'
Plug 'jdkanani/vim-material-theme'
Plug 'w0ng/vim-hybrid'
call plug#end()

" airline settings
let g:airline#extensions#tabline#enabled = 1

" ALE Linting options
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = 0

" turn syntax on
syntax on

" set encoding
set encoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow hidden buffers
set hidden

" stop file has changed messages when switching branches
set autoread

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

" turn on highlight for current line
set cursorline

" set number of visual spaces per TAB
set tabstop=4

" set number of visual spaces per TAB while editing
set softtabstop=4

" turn on tab completion menu
set wildmenu

" set vim to lower redraw rate
set lazyredraw

" make search highlight all matchesi and incremental search
set hlsearch
set incsearch

" open splits to the right and below of current view
set splitbelow
set splitright

" allow visually selected text to be searchable via `//`
vnoremap // y/<C-R>"<CR>

" set leader key to space
let mapleader = "\<space>"

" remap split navigations (left, down, up, right)
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" window splitting using leader
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

" window closures using leader
nnoremap <leader>wc <C-w>c
nnoremap <leader>wo <C-w>o

" remove searched word highlighting
nnoremap <leader>hf :noh<CR>

" Use leader for common FZF plugin commands
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fa :Ag<CR>

" NERDtree options
nnoremap <leader>nt :NERDTreeToggle<CR>

" enable code folding, blocking and fold level
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

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
set t_Co=256
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1
set bg=dark
colorscheme hybrid
let g:airline_theme='hybrid'

" clear the vim gutter colour
highlight clear SignColumn
