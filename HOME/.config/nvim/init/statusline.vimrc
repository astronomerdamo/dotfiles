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
