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
nmap <buffer> gm m"ysiw$`"l
xmap <buffer> g4 S$
xmap <buffer> gm S$


nmap <buffer> gi m"ysiw*`"l
xmap <buffer> gi S*gv<esc>
nmap <buffer> gb gigi
xmap <buffer> gb S*gvS*gv<esc>


" text-object code block , https://jdhao.github.io/2020/11/15/nvim_text_objects/
vnoremap <silent> ic :<C-U>call <SID>MdCodeBlockTextObj('i')<CR>
onoremap <silent> ic :<C-U>call <SID>MdCodeBlockTextObj('i')<CR>
vnoremap <silent> ac :<C-U>call <SID>MdCodeBlockTextObj('a')<CR>
onoremap <silent> ac :<C-U>call <SID>MdCodeBlockTextObj('a')<CR>

function! s:MdCodeBlockTextObj(type) abort
  normal! $
  let start_row = searchpos('\s*```', 'bnW')[0]
  let end_row = searchpos('\s*```', 'nW')[0]
  let buf_num = bufnr()
  if a:type ==# 'i'
    let start_row += 1
    let end_row -= 1
  endif
  call setpos("'<", [buf_num, start_row, 1, 0])
  call setpos("'>", [buf_num, end_row, 1, 0])
  execute 'normal! `<V`>'
endfunction

" * $ text object
xnoremap <buffer>ib :<c-u>call SelectInsideOrNext('\*\*','i')<cr>
onoremap <buffer>ib :normal viB<cr>
xnoremap <buffer>ab :<c-u>call SelectInsideOrNext('\*\*','a')<cr>
onoremap <buffer>ab :normal vaB<cr>

xnoremap <buffer>im :<c-u>call SelectInsideOrNext('\$','i')<cr>
onoremap <buffer>im :normal vim<cr>
xnoremap <buffer>am :<c-u>call SelectInsideOrNext('\$','a')<cr>
onoremap <buffer>am :normal vam<cr>

" next object region
nnoremap <space>b :call search('\*\zs.\+\ze\*')<cr>
nnoremap <space>m :call search('\$\zs.\+\ze\$')<cr>
nnoremap <space>j :call search('^#')<cr>


function! SelectInsideOrNext(char,mode) " select region for text-object, inside or next item
  if a:mode=='a'
    let pat = a:char..'\w.\{-}'..a:char
  elseif a:mode=='i'
    let pat = a:char..'\zs\w.\{-}\ze'..a:char
  else
    echo "error mode"
    return
  endif
  " if inside the char region
  if search( a:char, 'nb',line('.'))  && search( a:char, 'n',line('.') )
    let pat = '?'..pat
  else  " outside, go to next region
    let pat = '/'..pat
  endif " search command, then select the search region
    exec "normal! "..pat .."\<cr>"
    normal! gn
endfunction


call textobj#user#plugin('markdown', {
\   'a': {
\     'pattern': ['<', '>'],
\     'select-i': 'in',
\     'select-a': 'an', 
\   },
\   'b': {
\     'pattern': '\<\*.\+\*\>',
\     'select-i': 'i*',
\     'select-a': 'a*', 
\   },
\ })

