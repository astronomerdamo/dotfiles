" use vim defaults
set nocompatible

" define plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'w0rp/ale', { 'for': ['python', 'rust', 'haskell', 'scala'] }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" themes
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-two-firewatch'
Plug 'jdkanani/vim-material-theme'
Plug 'w0ng/vim-hybrid'
call plug#end()

" ALE Linting options display and usability options
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = 0

" ALE Rust linting
let g:ale_linters = {'rust': ['cargo']}

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

" set ctags
set tags=./tags,tags,tmp/tags;

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

" clear the vim gutter colour
highlight clear SignColumn

" statusline formatting
set laststatus=2
set statusline=
set statusline+=%1*\[%n\]
set statusline+=\ 
set statusline+=%2*%f
set statusline+=%m
set statusline+=%=
set statusline+=%{&fileformat}
set statusline+=\ 
set statusline+=\[
set statusline+=%l
set statusline+=\:
set statusline+=%c
set statusline+=\:
set statusline+=%P
set statusline+=\]
hi User1 ctermbg=black ctermfg=red   guibg=black guifg=red
hi User2 ctermbg=black ctermfg=white guibg=black guifg=white
