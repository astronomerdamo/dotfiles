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
