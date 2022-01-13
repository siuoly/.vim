" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

let b:coc_pairs = [["*","*"]]
" autocmd FileType markdown let b:coc_pairs = [["*","*"]]
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
