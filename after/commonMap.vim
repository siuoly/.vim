" exit i/c mode
inoremap jk <ESC>| inoremap kj <ESC>| cnoremap jk <esc>
cnoremap kj <esc>

" 使用q為存檔鍵, 做其他替換
" nnoremap q :silent! wall<CR>
cnoremap qq q!
cabbre ww silent! wall
cnoremap qw silent! wall <bar>bufdo qa!
nnoremap ZZ :wall <bar> qa<cr>
nnoremap <M-w> :wall<cr>
nnoremap <M-q> :q<cr>
command! Q normal! qq
nnoremap Q q
tnoremap <M-q> exit<cr>

" quick input command,quickfix window using ,or command window( <c-f> )
nnoremap <expr><cr> (&ft=="qf" \|\| &bt=="nofile") ? "<cr>":":"
xnoremap <cr> :
nnoremap <BS> <C-^>

" Home End
noremap H ^| noremap L g_

" for muscle memory

" quickly type "word"
nmap "W ysiw"

" macro
nnoremap <leader>q q

" omap 
onoremap b i(| onoremap p ip| onoremap B iB

" previous editing position
nnoremap g; 2g;


" scroll page
nnoremap <Up> <C-y>| nnoremap <Down> <C-e>

" search and no jump
nnoremap * *``


"insert mode move
inoremap <M-h> <Left>| inoremap <M-l> <right>
inoremap <M-j> <down>| inoremap <M-k> <up>
inoremap <M-H> <c-Left>| inoremap <M-L> <c-right>
inoremap <M-J> <end>| inoremap <M-K> <Home>
" inoremap <C-U> <UP><C-O>dd
"innoremap <C-S> <ESC>:w<CR>a  不可行

" let mapleader="\<space>"

" " nnoremap <leader>m :call OpenMakefile()<CR>

" Behave Vim
nnoremap Y y$
" Keeping it centered
nnoremap <expr>J  "m'" . v:count . "J`'"
nnoremap n nzz|   nnoremap N Nzz
" Jump list mutation
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" point For undo list
inoremap ; ;<c-g>u| inoremap " "<c-g>u
inoremap ( (<c-g>u| inoremap , ,<c-g>u
inoremap . .<c-g>u

" c++ use  ; unmap 解除map 定義"
"執行編譯結果 ,  %:當前檔名   '%:r': 去除副檔名的檔名
"Ref: https://vim.fandom.com/wiki/Get_the_name_of_the_current_file   &&   help !cmd
"expand() 在vim中擴展  不可用於shell中  expand('%:r')  '%:r' 
" no hlsearch or terminal back to normal mode
nnoremap <expr> <F2> &bt!="terminal" ? ":nohlsearch<cr>" : "i"
nnoremap <silent> <F6> :Tlist<CR>
command! VirEditToggle exe 'set ve=' . (&ve== "all"? "" : "all")|se ve
command! MouseToggle exe 'set mouse=' . (&mouse=="v" ? "":"v")|se mouse
command! Number set number! relativenumber!

" command test
nnoremap <M-1> :w<CR>:exe getline("1")[2:]<CR>
nnoremap <M-2> :w<CR>:exe getline("2")[2:]<CR>
nnoremap <M-3> :w<CR>:exe getline("3")[2:]<CR>
nnoremap <M-4> :w<CR>:exe getline("4")[2:]<CR>

" f cyclic move in ~/projects/vim/fmove/a.vim
" nnoremap <silent><expr>; search(getcharsearch().char,"",line('.'))==0 ? ",,,,,,,,,,,,," : ";"
" f <char> move,  ; --> next<char>,  : --> previous<char>
nnoremap <expr> : (&bt=="") ? "," : ":"

" tab 間移動
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-l> :tabn<CR>
" 當前檔案 在new tab中開啟
nnoremap <C-W><C-T> <C-W>T
command! SplitTab normal <c-w>T
" buffer move , list
nnoremap <M-p> :bp<cr> | nnoremap <M-n> :bn<cr>
nnoremap <m-b> :ls<cr>:b 

" args move
nnoremap <silent><C-j> :silent n <bar> ar<CR>
nnoremap <silent><C-k> :silent N <bar> ar<CR>
nnoremap <silent> <M-K> :m .-2<CR>
nnoremap <silent> <M-J> :m .+1<CR>
" Moving text
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
nnoremap <M-.> <C-w>><Cmd>echo "using c-arrow"<cr>| nnoremap <M-,> <C-w><<Cmd>echo "using c-arrow"<cr>

tnoremap <c-left>  <Cmd>vert res -1<cr>
tnoremap <c-right>  <Cmd>vert res +1<cr>
tnoremap <m-,>  <Cmd>vert res -1<cr>
tnoremap <m-.>  <Cmd>vert res +1<cr>
tnoremap <c-up> <Cmd> res +1<cr>
tnoremap <c-down> <Cmd> res -1<cr>




  " nnoremap <expr><F3> &bt=="" ? "<C-w>j<C-\><C-n><c-w>_H" :
  "     \"z10<cr>i" . "<C-_>k"

" browser open url , set .zshrc :
" export BROWSER='eval "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
nnoremap gx :call system("xdg-open ".expand('<cWORD>'))<CR>


"cmd abbreviation
cabbre h vert bo h| cabbre th tab h
cabbre term vert term

" Bash like keys for the command line
cnoremap <C-A> <Home>| cnoremap <C-E> <End>
cnoremap <c-n> <down>| cnoremap <c-p> <up>
cnoremap <m-b> <C-left>| cnoremap <m-f> <C-right>
cnoremap <m-d> <C-right><C-w>
" command move
cnoremap <m-h> <Left>
cnoremap <m-l> <Right>
" write file with sudo permission
cabbre w!! w !sudo tee %

" visual mode indent move
xnoremap <  <gv|  xnoremap > >gv
xnoremap <tab> >gv| xnoremap <s-tab> <gv


" trans,  pip install googletrans=a3.0
nnoremap gse :w !translate -d zh-TW <cword><CR>
xnoremap gse :w !xargs \| xargs -I {} translate -d zh-tw {}<CR>

" open configuration about filetype
nnoremap <leader>V :call Togglefile($VIMFILES .. "/after/ftplugin/" .&ft . ".vim")<CR>
nnoremap <leader>t :call Togglefile($VIMFILES .. "/templates/template." .&ft)<CR>
nnoremap <leader>c :call Togglefile($VIMFILES .. "$HOME/cheatsheet/" ..&ft ..".txt" )<CR>
" bash use"
nnoremap <leader>v :call Togglefile($VIMFILES .. '/vimrc')<CR>
nnoremap <leader>m :call Togglefile($VIMFILES .. '/after/commonMap.vim')<CR>
nnoremap <leader>p :call Togglefile($VIMFILES .. '/after/plug.vim')<CR>


nnoremap <leader>e :NERDTreeToggle<CR>
" ZoomToggle
nnoremap <leader>z <Cmd>ZoomToggle<cr>


" visual mode fold
xnoremap f zf

" mouse key setting  1.右鍵複製  2.右鍵複製 3.alt-右鍵 復原
nnoremap <RightMouse> p 
" xnoremap <LeftMouse> y
xnoremap <RightMouse> y
map <m-RightMouse> u

" folder function
function! AutoFoldDir()
pythonx << EOF
import os
text ='''
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
augroup END '''
with open( '.vimrc','a') as file:
  file.write(text)
EOF
endfunction
command! AutoFoldDir call AutoFoldDir() | source ./.vimrc





