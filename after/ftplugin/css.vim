" edit template
nnoremap <buffer> <leader>t : vsp ~/.vim/autoload/template.css<CR>

" edit map key
" nnoremap <buffer> <leader>V :vsp ~/.vim/after/ftplugin/css.vim

" open cheatsheet
nnoremap <buffer>\c :tabe /home/siuoly/cheatsheet/css.txt<CR>

"run test
nnoremap <buffer><C-D> :wall<CR>:call system( "explorer.exe ".matchstr(getline("1"), "\\w\\+.html"))<CR>
" nnoremap <buffer><C-D> :wall<CR>:exe "!explorer.exe ".matchstr(getline("1"), "\\w\\+.html") <CR><CR>



" function! GetHtmlFileName(linenum)
"   let line = getline(a:linenum)
"   return matchstr( line, "\\w\\+.html")
"
"   " let start = match( line , "\\w\\+.html")
"   " let end = matchend( line , "\\w\\+.html")
"   " return line[start:end]
" endf

" echo GetHtmlFileName(1)
