" Use Vim defaults (much better!)
set nocompatible

" Turn syntax on
syntax on

" commands for Vundle plugin manager
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
set laststatus=2
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_c = airline#section#create(['hunks'])
  let g:airline_section_x = airline#section#create(['filetype'])
  let g:airline_section_y = airline#section#create(['BN: %{bufnr("%")}'])
  let g:airline_section_z = airline#section#create(['(%l,%c)', ' - ', '%p'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'

" NERDtree options
nnoremap <C-N> :NERDTreeToggle<CR>

" insert spaces instead of tabs and set tab width to 4 space
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set autoindent

" language indent overrides
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

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

" turn line number on with relative line nu,bers from cursor
set number
set relativenumber

" make search highlight all matchesi and incremental search
set hlsearch
set incsearch

" open splits to the right and below of current view
set splitbelow
set splitright

" remap split navigations (up, down, left, right)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.

" toggle whitespace using leader
nnoremap <leader>w :set list!<CR>

" force markdown hilighting on *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set the colorscheme
set background=dark
colorscheme solarized
