
augroup remember_view
au!
" 在目前資料夾底下, 建立才會建立 view 檔案"
set viewdir=$PWD/.view
set viewoptions=folds "加快"
augroup remember_view
  au!
  " 在目前資料夾底下, 建立才會建立 view 檔案"
  execute 'au BufWinLeave '. $PWD .'/* silent! mkview!'
  execute 'au BufWinEnter '. $PWD .'/* silent! loadview'
  " au BufWinEnter * silent! loadview
augroup END 
