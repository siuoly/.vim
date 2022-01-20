
" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | 
\quit | endif 

" template using
augroup templateFile
  au!
  " autocmd BufNewFile .vimrc     0 read ~/.vim/autoload/temp_vimrc
  "
  " autocmd BufNewFile makefile   0 read ~/.vim/autoload/makefile
  " autocmd BufNewFile .tasks     0 read ~/.vim/tasks.ini

  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/template.' . expand('<afile>:e')
        " \|echom expandcmd('0r $HOME/.vim/templates/template.'. &ft )
  " run command substitute
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  autocmd BufNewFile * %substitute#\[:VIM_SYSTEM:\]\(.\{-\}\)\[:END_SYSTEM:\]#\=system(submatch(1))#ge
  autocmd BufNewFile * %substitute#\[:VIM_EXE:\]\(.\{-\}\)\[:END_EXE:\]#\=execute(submatch(1))#ge

augroup END

"help page resize
autocmd FileType help vertical resize 78


" plugin vim-terminal-help have the key mapping , so need not this
" fix meta-keys which generate <Esc>a .. <Esc>z
" let c='a'
" while c <= 'z'
"   exec "set <M-".toupper(c).">=\e".c
" exec "imap \e".c." <M-".toupper(c).">"
" let c = nr2char(1+char2nr(c))
" endw

" can use --> map <M-a> :echo "alt+a is using"
" http://www.skywind.me/blog/archives/1846
