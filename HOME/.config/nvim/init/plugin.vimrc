" define plugins
call plug#begin('~/.local/share/nvim/plugged')

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-two-firewatch'
Plug 'jdkanani/vim-material-theme'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/seoul256.vim'

" editor
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" general
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" python

" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

call plug#end()
