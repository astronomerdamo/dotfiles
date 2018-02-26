" turn on syntax
syntax on

" allow hidden buffers
set hidden

" stop file has changed messages when switching branches
set autoread

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

" Timeout for escape sequences
set ttimeoutlen=0

" turn on tab completion menu
set wildmenu

" open splits to the right and below of current view
set splitbelow
set splitright

" set ctags
set tags=./tags,tags,tmp/tags;

" allow visually selected text to be searchable via `//`
vnoremap // y/<C-R>"<CR>

" enable code folding, blocking and fold level
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" set list characters for viewing whitespace
set listchars+=eol:$,space:.

" set colorscheme
set t_Co=256
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1
set bg=dark
colorscheme hybrid

" clear the vim gutter colour
highlight clear SignColumn
