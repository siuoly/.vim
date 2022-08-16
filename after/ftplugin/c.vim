" OmniCppComplete initialization
call omni#cpp#complete#Init()


" nnoremap <buffer> <leader>V :vsp ~/.vim/after/ftplugin/c.vim

"complie command setting  replace by AsyncTask-plugin
"setlocal makeprg=c++\ -g\ -Wall\ -Wextra\ %\ &&./a.out
" map <buffer><C-D> :w <bar> !cc -g -pedantic -Wall -Wextra % -lncurses -lmenu &&./a.out<CR>
" map <buffer><C-C> :w<CR>:!cc -g -pedantic -Wfatal-errors -w -DDEBUG % -lncurses -lmenu &&./a.out<CR>
nnoremap <buffer> <m-d> :w<cr>:exe 'H gcc '.expand('%').. '&& ./a.out'<cr>



"cppman open manpage for c++
":help Terminal-mode for switch mode
" nnoremap <silent> K :tab term ++shell ++close man <cWORD> <CR>

"Debug: Termdeg executable
let g:termdebug_wide = 1

"ctag
" map \t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"fold
" nnoremap zf zfaB

" inoremap <buffer> {{ {a}bx
nmap `' `'zz
nmap `` ``zz


"inoremap dw dW
iabbr //c /* */<Left><Left><Left>
iabbr #i #include
iabbr #d #define
iabbr #e #endif
iabbr #f #ifdef
inoremap <buffer>{{ {<cr>}<c-o>b<c-o>o

"miss input
iabbr itn int
iabbr retrun return 

"move
nmap [m [[?\(){$\)\\|\()$\n\t*{\)
"nmap ]m 
noremap <buffer>[[ ?{<CR>w99[{
nmap  <buffer>]]   j0[[%//{<CR>
noremap <buffer>( [(
noremap <buffer>) ])
noremap <buffer>{ 99[{
noremap <buffer>} 99]}
noremap <buffer><S-Tab> ?[)}]<CR>


"omap
onoremap <buffer>w iw
onoremap <buffer>b ib
onoremap <buffer>B iB

"cwindow

"search path
"set path+=/usr/include/c++/9,/usr/include/linux,/usr/include/x86_64-linux-gnu/c++/9,/usr/include/x86_64-linux-gnu

" OmniCppComplete initialization
call omni#cpp#complete#Init()
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
set completeopt=menu


