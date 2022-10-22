" esc
inoremap <c-@> <esc>
cnoremap <c-@> <c-c>
inoremap <m-q> <esc>
inoremap <m-w> <esc>
cnoremap <m-q> <c-c>
xnoremap q <esc>
inoremap jk <esc>
inoremap kj <esc>
cnoremap jk <c-c>
cnoremap kj <c-c>
" nnoremap q :silent! wall<CR>
cnoremap qq q!<cr>
cnoremap qw silent! wall <bar>bufdo qa!<cr>
nnoremap <M-q> :q<cr>
tnoremap <M-q> exit<cr>

" quick input command,quickfix window using ,or command window( <c-f> )
nnoremap <expr><cr> (&ft=="qf" \|\| &bt=="nofile") ? "<cr>":":"
xnoremap <cr> :
nnoremap <BS> <C-^>

" Home End
noremap H ^| noremap L g_

" omap 
onoremap b i(| onoremap p ip| onoremap B iB

" previous editing position
nnoremap g; 2g;

" search and no jump
nnoremap * *``

"insert mode move
inoremap <M-h> <Left>| inoremap <M-l> <right>
inoremap <M-j> <down>| inoremap <M-k> <up>
inoremap <c-h> <c-left>| inoremap <c-l> <c-right>
inoremap <M-H> <home>| inoremap <M-L> <end>
inoremap <M-J> <end>| inoremap <M-K> <Home>

" Behave Vim
nnoremap Y y$

" Keeping it centered
nnoremap <expr>J  "m'" . v:count . "J`'"
" nnoremap n nzz|   nnoremap N Nzz
" Jump list mutation
nnoremap j gj|nnoremap k gk
xnoremap k gk|xnoremap j gj

" point For undo list
inoremap ; ;<c-g>u
inoremap " "<c-g>u
inoremap ( (<c-g>u
inoremap , ,<c-g>u
inoremap . .<c-g>u

" <c-z> in insert mode for simulate windows system
inoremap <c-z> <c-o>u

" no hlsearch or terminal back to normal mode
nnoremap <expr> <F2> &bt!="terminal" ? ":nohlsearch<cr>" : "i"
command! VirEditToggle exe 'set ve=' . (&ve== "all"? "" : "all")|se ve
command! Number set number! relativenumber!
command! Path let @+= expand('%:p')|echo @+

"terminal mapping
set termwinkey=<m-;>
tnoremap <m-h> <Cmd>wincmd h<cr>
tnoremap <m-l> <Cmd>wincmd l<cr>
tnoremap <m-j> <Cmd>wincmd j<cr>
tnoremap <m-k> <Cmd>wincmd k<cr>
tnoremap <m-N> <Cmd>wincmd p<cr>
tnoremap <m-q> <c-\><c-n>
tnoremap <m--> <c-_>"0
execute 'tnoremap <m--> '..&termwinkey..'"0'

" be changed
tnoremap <m-p> <c-_>"0
tnoremap <F2> <C-\><C-N><CR>  

" tab 間移動
nnoremap <silent> <C-h> <Cmd>tabp<CR>
nnoremap <silent> <C-l> <Cmd>tabn<CR>
tnoremap <silent> <C-h> <Cmd>tabp<CR>
tnoremap <silent> <C-l> <Cmd>tabn<CR>

" terminal 之間跳轉
nnoremap <m-w> <Cmd>call JumpTerminalWin()<cr>
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
  if &bt=='' && GetWinTerminalBuffer() != -1
    echo win_gotoid( bufwinid( GetWinTerminalBuffer() ) )
    return
  endif
  if &ft=='' && &bt=='terminal' 
    execute "normal \<c-w>p"| return
  endif
endfunction

" move fast by paragraph
nnoremap <c-j> }
nnoremap <c-k> {


" Moving text
nnoremap <silent> <M-K> :m .-2<CR>
nnoremap <silent> <M-J> :m .+1<CR>
xnoremap <m-J> :m '>+1<cr>gv
xnoremap <m-K> :m '<-2<cr>gv

"window move
nnoremap <silent><m-h> :wincmd h<CR>
nnoremap <silent><m-j> :wincmd j<CR>
nnoremap <silent><m-k> :wincmd k<CR>
nnoremap <silent><m-l> :wincmd l<CR>

"window size control
nnoremap <c-left>  <C-w><| nnoremap <c-right> <C-w>>
nnoremap <c-up>    <C-w>+| nnoremap <c-down>  <C-w>-
nnoremap <M-.> <C-w>><Cmd>echo "using c-arrow"<cr>
nnoremap <M-,> <C-w><<Cmd>echo "using c-arrow"<cr>
tnoremap <c-left>  <Cmd>vert res -1<cr>
tnoremap <c-right>  <Cmd>vert res +1<cr>
tnoremap <m-,>  <Cmd>vert res -1<cr>
tnoremap <m-.>  <Cmd>vert res +1<cr>
tnoremap <c-up> <Cmd> res +1<cr>
tnoremap <c-down> <Cmd> res -1<cr>

" browser open url , set .zshrc :
nnoremap gx :call system("explorer.exe ".expand('<cWORD>'))<CR>


"cmd abbreviation
cabbre h vert bo h
cabbre th tab h
cabbre term rightbelow vertical terminal
cabbre tterm tab terminal
cabbre ee tabe
" write file with sudo permission
cabbre w!! w !sudo tee %
cabbre ww silent! wall

" Bash like keys for the command line
cnoremap <C-A> <Home>| cnoremap <C-E> <End>
cnoremap <c-n> <down>| cnoremap <c-p> <up>
cnoremap <m-b> <C-left>| cnoremap <m-f> <C-right>
cnoremap <m-d> <C-right><C-w>
" command move
cnoremap <m-h> <Left>
cnoremap <m-l> <Right>

" command test
nnoremap <M-1> :w<CR>:exe getline("1")[2:]<CR>
nnoremap <M-2> :w<CR>:exe getline("2")[2:]<CR>
nnoremap <M-3> :w<CR>:exe getline("3")[2:]<CR>
nnoremap <M-4> :w<CR>:exe getline("4")[2:]<CR>

" visual mode indent move
xnoremap <  <gv|  xnoremap > >gv
xnoremap <tab> >gv| xnoremap <s-tab> <gv

" open configuration about filetype
nnoremap <leader>v :tabe $MYVIMRC<cr>
nnoremap <leader>z :tabe ~/.zshrc<cr>
nnoremap <leader>p :tabe $VIMFILES/after/plug.vim<CR>
nnoremap <leader>m :tabedit $VIMFILES/after/commonMap.vim<cr>
nnoremap <leader>V :exec "tabe $VIMFILES/after/ftplugin/" .&ft .".vim"<cr>
nnoremap <leader>t :call Togglefile($VIMFILES .. "/templates/template." .&ft)<CR>

" bash use"

" buffer list
nnoremap <m-b> :ls<cr>:b 

" Keep cursor at the bottom of the visual selection after you yank it.
xnoremap y ygv<Esc>

" selcet pasted text
nnoremap gp `[v`]
" mouse key setting  1.右鍵複製  2.右鍵複製 3.alt-右鍵 復原
nnoremap <RightMouse> p 
xnoremap <RightMouse> y
map <m-RightMouse> u


"----------------------------------------------------------------------
" enable alt key in terminal vim
"----------------------------------------------------------------------
set ttimeout
if $TMUX != ''
  set ttimeoutlen=35
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
  set ttimeoutlen=85
endif
function! s:meta_code(key)
  if get(g:, 'terminal_skip_key_init', 0) == 0
    exec "set <M-".a:key.">=\e".a:key
  endif
endfunc
for i in range(10)
  call s:meta_code(nr2char(char2nr('0') + i))
endfor
for i in range(26)
  call s:meta_code(nr2char(char2nr('a') + i))
endfor
for i in range(15) + range(16, 25)
  call s:meta_code(nr2char(char2nr('A') + i))
endfor
for c in [',', '.', '/', ';', '{', '}']
  call s:meta_code(c)
endfor
for c in ['?', ':', '-', '_', '+', '=', "'"]
  call s:meta_code(c)
endfor
function! s:key_escape(name, code)
  if get(g:, 'terminal_skip_key_init', 0) == 0
    exec "set ".a:name."=\e".a:code
  endif
endfunc
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
