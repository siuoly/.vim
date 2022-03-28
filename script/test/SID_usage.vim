function s:Echo()
  echo 123
endfunction

nnoremap ss :call <SID>Echo()<cr>

command EE call s:Echo()
call <SID>Echo()

" au! InsertLeave * call <SID>Echo()
au! InsertLeave * call s:Echo()

