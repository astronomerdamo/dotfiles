" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-two-firewatch'
Plug 'jdkanani/vim-material-theme'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/seoul256.vim'

" editor

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" general
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" linting
Plug 'w0rp/ale', { 'for': ['python', 'rust', 'haskell', 'scala'] }

" python

" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

call plug#end()
