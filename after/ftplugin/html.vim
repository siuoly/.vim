"open map setting
" nnoremap <buffer>\V :vsp ~/.vim/after/ftplugin/html.vim

" open cheatsheet
nnoremap <buffer>\c :tabe /home/siuoly/cheatsheet/html.txt<CR>

" edit template
" nnoremap <buffer>\t :vsp ~/.vim/autoload/template.html<CR>


"run test
" nnoremap <buffer><C-D> :w<CR>:!explorer.exe %<CR><CR>
nnoremap <buffer><C-D> :w<CR>:call system("explorer.exe ".expand("%") )<CR>
command! RefreshBrowser AsyncRun -silent -cwd=~/.vim/after/ftplugin/html explorer.exe refresh.ahk
nnoremap <buffer><F5> :w<CR>:RefreshBrowser<cr>

" comment
nnoremap <expr> getline( ".")[ indent(".")] == '/' ?
      \ "^3x$xxx" :
      \ "I/* <c-o>A */<esc>"
xnoremap  <esc>`>a */<c-o>`</* <esc>

" configuration
set iskeyword+=-
set iskeyword+=.

"edit
"<NUL> 不可在新注音下,使用,  需用English輸入法
" imap <buffer><NUL> </<C-X><C-O>
" jump tags
nnoremap ]t /<[^</>]\+>\zs<CR>:noh<CR>
nnoremap [t ?<[^</>]\+>\zs<CR>:noh<CR>

"abbreviation

"omap
onoremap w iw
onoremap b ib
onoremap B iB
onoremap t it

"xmap
xnoremap t it

" got to tag
nnoremap gt vito<ESC>

" edit use
" inoremap {{ {<CR>}<C-O>O

setlocal et
setlocal ts=2 sw=2 sts=2

" 貼上RGP 顏色
command! -buffer RGB put='rgb('. getreg('+') .');'
" 格式化 1 行html,  先取代<...></> 符號，再做縮排
command! HtmlFormat s/></>\r</g |normal! =ip

" refresh the chrome window
command! -buffer RefreshChrome call system('cmd.exe /c `wslpath -w ~/.vim/after/ftplugin/html/F5_chrome.exe`')
nnoremap <buffer> <f5> :w<cr>:call system('cmd.exe /c `wslpath -w ~/.vim/after/ftplugin/html/F5_chrome.exe`')<cr>


packadd matchit
