"open python.vim
" nnoremap <buffer>\V :vsp ~/.vim/after/ftplugin/python.vim

""run test  replace by "async-task plugin"
nnoremap <buffer><m-d> :w<CR>:exec "H python " ..expand('%')<cr>
" stop the Task
map <buffer><m-c> <Cmd>call JumpTerminalWin()<cr><c-c>

" for "chmod +x" autoload
setlocal autoread
setlocal signcolumn=yes

" python terminal mode
let ipython='rightbelow vertical terminal ++close ++shell cd %:p:h && ipython'
nnoremap <buffer><f7> :call Maketerm(ipython)<bar>SlimeConfig<cr>

function! TabhasTerm()
  for i in  tabpagebuflist()
    if index(term_list(),i) > -1| return 1| endif
  endfor
  return 0
endfunction

function! Maketerm(ipython)
  if !TabhasTerm()
    if len(term_list()) > 0
      let n = term_list()[0]
      execute "rightbelow vertical sb ".. n
    else
      " SlimeConfig | wincmd H
      execute a:ipython
      wincmd w
    endif
  endif 
  wincmd h
endfunction
" open ternimal when start
if !has_key(g:,'py_start') && bufnr('$')==1 && term_list()==[]
  " call Maketerm()
  " let g:py_start = 1
endif


nnoremap <m-w> :call JumpTerminalWin()<cr>
tnoremap <m-w> <Cmd>call JumpTerminalWin()<cr>
tmap <m-e> <f2>| map <m-e> <f2>
"找出所有 terminal buffer, 聯集winbuffer, 找出 buffer , 轉換 winid , 跳躍
" return terminal buffer num in current page
function! GetWinTerminalBuffer() 
  for i in term_list()
    for j in tabpagebuflist()
      if i == j| return i| endif
    endfor
  endfor
  return -1
endfunction
function! JumpTerminalWin()
  if &ft=='python' && &bt=='' && GetWinTerminalBuffer() != -1
    echo win_gotoid( bufwinid( GetWinTerminalBuffer() ) )
    return
  endif
  if &ft=='' && &bt=='terminal' 
    execute "normal \<c-w>p"| return
  endif
endfunction



""""""""""""""""""""""""""""""""""""""""
" 建立 ## 區域,  刪除 ## 區域
nnoremap <c-j> :IPythonCellNextCell<cr>
nnoremap <c-k> :IPythonCellPrevCell<cr>
nnoremap <space>b o<esc>3i#<esc>a<space><esc>
nnoremap <f5> :tab terminal pudb3 %:p<cr>
" Ipython Vim
nnoremap <space><space> :IPythonCellExecuteCell<cr>
nnoremap <space>r :IPythonCellRun<cr>
nnoremap <expr><space>r ":SlimeSend1 run " ..expand('%') .. "<cr>"
command -buffer QTconsole !jupyter qtconsole&
"""""" Ipython Vim display variable to REPL window
" fold region, move to bottom boundary (### > 3 or EOF), VisualLine select ,
" and move to top boundary (### >3 or Begin of file)
nnoremap <space>d /#\{3,}\<bar>\%$/-2<cr>V?#\{3,}\<bar>\%^<cr>zf
" copy region
nnoremap <space>y m"/###\<bar>\%$/-1<cr>V?###\<bar>\%^<cr>y`"
" send word
nnoremap <space>w :execute 'SlimeSend1 '.. expand("<cword>")<cr>
nnoremap <space>W :execute 'SlimeSend1 '.. expand("<cWORD>")<cr>
xnoremap <space>w y:execute 'SlimeSend1 '.. @+ <cr>
" sned print
nnoremap <space>t :execute 'SlimeSend1 type('.. expand("<cword>")..")"<cr>
" send variable.shape
nnoremap <space>s :execute 'SlimeSend1 '.. expand("<cword>")..".shape"<cr>
nnoremap <space>S :execute 'SlimeSend1 '.. expand("<cWORD>")..".shape"<cr>
xnoremap <space>s y:execute 'SlimeSend1 '.. @+ ..".shape"<cr>
" send len(variable)
nnoremap <space>l :execute 'SlimeSend1 len('.. expand("<cWORD>")..')'<cr>
xnoremap <space>l y:execute 'SlimeSend1 len('.. @+ ..')'<cr>
" run line
nnoremap <space>q yy:execute 'SlimeSend1 ' .. @"[:-2]<cr>
xnoremap <space><space> y:execute 'SlimeSend1 %paste'<cr>

" list function, import, class
nnoremap <space>f :g/\<def\>\<bar>\<class\><cr>:
nnoremap <space>f :lvimgrep/^\s*\<def\>\<bar>^\s*\<class\>/j %<bar>:llist<cr>:silent ll 
nnoremap <space>F :lvimgrep/###/j % <bar>llist<cr>:silent ll 

" send to anothoer tmux window , print the globals() variable
" function! Showvar()
"   SlimeSend1 _show_global_var()
"   let cmd = 'tmux send-keys -t .0 "cat .var" ENTER'
"   call system(cmd)
" endfunction
" command! Showvar call Showvar()
" nnoremap <space>v :Showvar<cr>


""""""""""""""""" Ultisnip pytorch """""""""""""""""""""""""

command! -buffer Snip call SnippetPython()

function! SnippetPython()
  let snipList = readdir( '/home/siuoly/.vim/UltiSnips/' , {n->n=~'python*'})
  let choicelist =  string(snipList) .. ": " 
  let choice = str2nr( input(choicelist) ) - 1
  execute "UltiSnipsAddFiletypes " .. snipList[choice]
endfunction


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


" ------------ un use --------------------------

" function --> command
command! -buffer -range -nargs=0 RunPy call RunPy(<line1>, <line2>)
" python console terminal
command! -buffer PythonConsole belowright terminal ++rows=10 ++close python3.8
" run current line code
nnoremap <buffer><C-s> :exe "pyx "..getline(".")<cr>
" run region code in visual mode
" xnoremap <buffer><c-s> :RunPy<cr>
" run region code in normal mode
nnoremap <buffer><m-s> vip:RunPy<cr>


