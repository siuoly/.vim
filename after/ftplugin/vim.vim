" nnoremap <buffer> <C-D> :w<CR>:so %<CR>
" nnoremap <buffer> <space><space> :w<CR>:so %<CR>

" " 1.執行單行程式碼 <c-s> , commented,not commented
nnoremap <buffer><expr><space>q getline('.')[0]== '"' ?
      \ ":exec getline('.')[1:]<cr>" :
      \ ":exec getline('.')<cr>"



" 2.執行段落程式碼 <m-s>
nnoremap <buffer><m-d> vip:yank z <cr>:execute substitute( @z , '\n".\{-1,}\ze\n' , '' , 'g')<cr>:let v:hlsearch=0<cr>

nnoremap <space>m vip:<esc>:call RunBlockVimScript()<cr>
function RunBlockVimScript()
  let tempfile=tempname()
  silent execute "'<,'>w " .. tempfile
  execute "source" .. tempfile
endfunction

" 顯示cursor 內文
nnoremap <silent><buffer><space>w :execute 'echo '..expand('<cword>')<cr>

" 3.執行block程式碼 <m-d>
nnoremap <buffer><space><space> :?^"-?+1,/^"-/-1 yank z <bar> exec substitute( @z , '\n".\{-1,}\ze\n' , '' , 'g')<cr>:silent let v:hlsearch=0<cr>
nnoremap <buffer><space>r :so %<cr>
nnoremap <buffer><space>s o<c-o>0"-<esc>j
nnoremap <buffer><c-j> :call search('"""')<cr> 
nnoremap <buffer><c-k> :call search('"""' , 'b')<cr>
