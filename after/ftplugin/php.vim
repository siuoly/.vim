
nnoremap <buffer><c-c> <Cmd>call system("explorer.exe http://localhost:19233/" . expand('%'))<cr>

nnoremap <space>; m'A;<esc>``
" se ft=html

set iskeyword+=.

nnoremap <buffer><C-D> :w<CR>:call system("explorer.exe ".expand("%") )<CR>
nnoremap <buffer><F5> :w<CR>:RefreshBrowser<cr>

" using refresh.ahk autohotkey script to refresh the window, asynchroniouslly
" -silent: without quickfix window
" -cwd: the directory of the script
" explorer.exe refresh.ahk : open the script by cmd
command! RefreshBrowser AsyncRun -silent -cwd=~/.vim/after/ftplugin/html explorer.exe refresh.ahk

" when write, refresh automatically
augroup auto_refresh_browser
  " au! BufWritePost <buffer> RefreshBrowser
augroup END
