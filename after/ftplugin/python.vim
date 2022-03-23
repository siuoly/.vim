"open python.vim
" nnoremap <buffer>\V :vsp ~/.vim/after/ftplugin/python.vim

""run test  replace by "async-task plugin"
nnoremap <buffer><m-d> :w<CR>:exec "H python " ..expand('%')<cr>
" stop the Task
map <buffer><m-c> <Cmd>call JumpTerminalWin()<cr><c-c>

"map <buffer><C-D> :w<CR>:!python3.8 %<CR>
"map <buffer><C-C> :w<CR>:!ipython -i %<CR>
"map <buffer><C-C> :w<CR>:!chmod +x % && ./%<CR>

setlocal foldmethod=indent
setlocal foldlevel=99


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

" python terminal mode
nnoremap <buffer><f7> :SlimeConfig <cr><c-w>H<Cmd>sb cmd<cr><C-_>T<Cmd>tabp<cr>

""""""""""""""""""""""""""""""""""""""""
" 建立 ## 區域,  刪除 ## 區域
nnoremap <space>j :IPythonCellNextCell<cr>
nnoremap <space>k :IPythonCellPrevCell<cr>
" nnoremap <space>b :IPythonCellInsertBelow<cr>
nnoremap <space>b o<esc>3i#<esc>j


" Ipython Vim
nnoremap <space><space> :IPythonCellExecuteCell<cr>
nnoremap <space>r :IPythonCellRun<cr>
nnoremap <expr><space>r ":SlimeSend1 run " ..expand('%') .. "<cr>"
nnoremap <space>c :SlimeSend1 <c-v><c-c><cr>
command -buffer QTconsole !jupyter qtconsole&
" Ipython Vim display variable to REPL window
nnoremap <space>w :execute 'SlimeSend1 '.. expand("<cword>")<cr>
nnoremap <space>W :execute 'SlimeSend1 '.. expand("<cWORD>")<cr>
nnoremap <space>p :execute 'SlimeSend1 '.. 'print('.. expand("<cword>") ..')'<cr>


""""""""""""""""" Ultisnip pytorch """""""""""""""""""""""""
command! -buffer Sniptorch UltiSnipsAddFiletypes python-torch
command! -buffer Sniprequests UltiSnipsAddFiletypes python-requests
command! SnipRefresh call UltiSnips#RefreshSnippets()

command! CmdTorch call CmdTorch()
function! CmdTorch()
  let g:slime_target = "vimterminal"
  let g:slime_vimterminal_cmd ="cmd.exe /k conda activate base && ipython"

endf


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

" xnoremap <silent> <space><space> :yank<cr>:silent call term_sendkeys(Get_term_buff(), "%paste -q \n")<cr>

" list function, import, class
nnoremap <space>l :g/\<def\>\<bar>\<class\><cr>:
nnoremap <space>l :lvimgrep/^\s*\<def\>\<bar>^\s*\<class\>/j %<bar>:llist<cr>:silent ll 
nnoremap <space>L :lvimgrep/###/j % <bar>llist<cr>:silent ll 



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


