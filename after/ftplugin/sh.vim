" nnoremap \V :vsp ~/.vim/after/ftplugin/sh.vim
" nnoremap \c :tabe ~/cheatsheet/bashsheet<CR>


"run shell  " replace by AsyncTask plugin"
"bash -n <..> check the script <syntax></syntax>
" nnoremap <buffer> <C-D> :w<CR>:!./%<CR>
" nnoremap <buffer> <C-C> :w<CR>:!bash -n %<CR>
nnoremap <buffer> <C-F> :w<CR>:!chmod +x % && ./% <CR>

nnoremap <buffer><expr> <m-d> expandcmd(":w<bar> H source % <cr>")
" nnoremap <buffer><expr> <m-d> expandcmd(":w<bar> H ./% <cr>")

" run current line code
" nnoremap <buffer><c-s> :exec "w !".getline('.')<cr>
nnoremap <buffer><expr><c-s> getline('.')[indent('.')]== '#' ?
      \ ":!" .. getline('.')[1:] .. "<cr>" :
      \ ":!" .. getline('.') .. "<cr>"

setlocal autoread

"comment
" nmap  I#<ESC>
" xnoremap  :s+^+#+<CR>

"abbreviation
iabbr #i #!/bin/bash


"omap
onoremap w iw




