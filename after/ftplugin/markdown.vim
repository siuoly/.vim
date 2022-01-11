" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

function! SlashEndLine()
  let end = getline('.')[col('$')-2]
  if end == '\'
    call setline('.',getline('.')[:-2])
  else 
    call setline('.', getline('.').'\' )
  endif
endfunc
nnoremap <buffer> ;; <Cmd>call SlashEndLine()<cr>

nmap <buffer><silent> <c-p> :call mdip#MarkdownClipboardImage()<CR>
