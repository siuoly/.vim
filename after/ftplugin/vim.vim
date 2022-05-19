" nnoremap <buffer> <C-D> :w<CR>:so %<CR>
nnoremap <buffer> <space><space> :w<CR>:so %<CR>

" " 1.執行單行程式碼 <c-s> , commented,not commented
nnoremap <buffer><expr><c-s> getline('.')[0]== '"' ?
      \ ":exec getline('.')[1:]<cr>" :
      \ ":exec getline('.')<cr>"



" 2.執行段落程式碼 <m-s>
" 3.執行block程式碼 <m-d>
nnoremap <buffer><m-s> vip:yank z <cr>:execute substitute( @z , '\n".\{-1,}\ze\n' , '' , 'g')<cr>
nnoremap <buffer><m-d> :?^"-?+1,/^"-/-1 yank z <bar> exec substitute( @z , '\n".\{-1,}\ze\n' , '' , 'g')<cr>

