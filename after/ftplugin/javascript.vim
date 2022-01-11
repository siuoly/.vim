
"open python.vim
" nnoremap <buffer>\V :vsp ~/.vim/after/ftplugin/javascript.vim
" nnoremap <buffer>\t :vsp ~/.vim/autoload/template.js<CR>

"run test
nnoremap <buffer><C-D> :w<CR>:!node %<CR>
nnoremap <buffer><C-D> :w<CR>:exe expandcmd("H node %")<cr>
nnoremap <buffer><m-d> :w<CR>:exe expandcmd("H node %")<cr>

"omap
onoremap w iw
onoremap b ib
onoremap B iB


" inoremap <buffer> {{ {<CR>}<C-O>O
