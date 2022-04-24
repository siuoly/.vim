
xnoremap il :<c-u>normal! g_v^<cr>
xnoremap al :<c-u>normal! $v0<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>
xnoremap <silent> id :<c-u>normal! G$Vgg0<cr>
onoremap <silent> id :<c-u>normal! GVgg<cr>

" /* ......   */
xnoremap i/ ?\/\*<cr>o/\*\//s+1<cr>
" last input text
xnoremap ii `[<esc>v`]h



function! SearchInline(key,direction)
  " right search"
  if a:direction == 'r'
    " search and move , line('.') limit searching in current line "
    let ret = search(')','',line('.') )
    " res ==0 mean not found
    if ret == 0
      " call search from the line start position, and at the first match position
      call search('^.\{-}' .. a:key , 'be' , line('.') )
    endif
  " left search
  else
    let ret = search( a:key,'b',line('.') )
    if ret == 0
      call search( '.*'.. a:key , 'e' , line('.') )
    endif
  endif
endfunc

nnoremap ) :call SearchInline(')', 'r')<cr>
nnoremap ( :call SearchInline('(', 'l')<cr>
onoremap ) :call SearchInline(')', 'r')<cr>
onoremap ( :call SearchInline('(', 'l')<cr>


