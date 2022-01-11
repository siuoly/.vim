"open python.vim
" nnoremap <buffer>\V :vsp ~/.vim/after/ftplugin/python.vim

""run test  replace by "async-task plugin"
map <buffer><m-d> :w<CR>:exec "H python3.8 " ..expand('%')<CR>
" stop the Task
map <buffer><m-c> <Cmd>call JumpTerminalWin()<cr><c-c>

"map <buffer><C-D> :w<CR>:!python3.8 %<CR>
"map <buffer><C-C> :w<CR>:!ipython -i %<CR>
"map <buffer><C-C> :w<CR>:!chmod +x % && ./%<CR>


" for "chmod +x" autoload
setlocal autoread

"abbreviation
iabbr #i import

" run current line code
nnoremap <buffer><C-s> :exe "pyx "..getline(".")<cr>
" run region code in visual mode
" xnoremap <buffer><c-s> :RunPy<cr>
" run region code in normal mode
nnoremap <buffer><m-s> vip:RunPy<cr>

" function --> command
command! -buffer -range -nargs=0 RunPy call RunPy(<line1>, <line2>)

" python console terminal
command! -buffer PythonConsole belowright terminal ++rows=10 ++close python3.8


""""""""""""""""""""""""""""""""""""""""
" 建立 ## 區域,  刪除 ## 區域
nnoremap <space>] :IPythonCellNextCell<cr>
nnoremap <space>[ :IPythonCellPrevCell<cr>
" nnoremap <space>b :IPythonCellInsertBelow<cr>
nnoremap <space>b o<esc>3i#<esc>j


" Ipython Vim
nnoremap <space><space> :IPythonCellExecuteCell<cr> 
command -buffer QTconsole !jupyter qtconsole&

" Ipython Cell send range
function! Get_term_buff()
  for i in term_list()
    for j in tabpagebuflist()
      if i == j
        return i
      endif
    endfor
  endfor
  return 0
endfunction
xnoremap <silent> <space><space> :yank<cr>:silent call term_sendkeys(Get_term_buff(), "%paste -q \n")<cr>


" down, size exit directly"
if exists("g:PythonFunc") | finish | endif
" run line1 ~ line2 code
let g:PythonFunc=1
function! RunPy(line1,line2)
  let tname = tempname()
  exec a:line1..","..a:line2 .. "w!  " .. tname
  exec "pyxfile" .. tname
  call delete( tname )
endfunc


" using "gf" jump the the module file
" https://vim.fandom.com/wiki/Automatically_add_Python_paths_to_Vim_path
python3 <<EOF
import os
import sys
import vim
for p in sys.path:
  if os.path.isdir(p): 
    vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF


