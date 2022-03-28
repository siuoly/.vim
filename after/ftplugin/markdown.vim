" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

nn mm :MarkdownPreview<cr>

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
" nnoremap <buffer> ;; <Cmd>call SlashEndLine()<cr>

nn <buffer><c-p> :call mdip#MarkdownClipboardImage()<cr>

" high light text
xmap <buffer> g` S`
nmap <buffer> g` m"ysiw``"l
nmap <buffer> g4 m"ysiw$`"l
xmap <buffer> g4 S$


nmap <buffer> gi m"ysiw*`"l
xmap <buffer> gi S*
nmap <buffer> gb viwS*gvS*
xmap <buffer> gb S*gvS*

