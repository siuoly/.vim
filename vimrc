"vim doc         http://vimcdoc.sourceforge.net/
"vim zh-ch       https://yianwillis.github.io/vimcdoc/doc/help.html
" : option  查看所有option

" default setting , make problem less
runtime defaults.vim
set termguicolors
set ttymouse=sgr
set mouse=a
set number relativenumber numberwidth=1
set cursorline 
set shortmess+=I shortmess-=S
set enc=utf-8 cpoptions+=y " ("1y) ("1p) using
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent 
set hlsearch incsearch ignorecase smartcase
autocmd! InsertEnter * call feedkeys("\<Cmd>noh\<cr>" , 'n') " close hlsearch when search
set ambiwidth=double        "prevent enter replace mode on Conemu"
call setcellwidths([[0x2588, 0x258f, 1]])
set modeline exrc secure
set scrolloff=9
set ssop-=fold,option "no save map,fode imformtion
"
set foldlevelstart=0
" You can also use one of ¦, ┆, │, ⎸, or ▏ , ❚   
" 關閉fold 水平線, 設定foldcolumn風格, " beatufile window split board
set fillchars=fold:\ ,foldsep:\|,foldopen:▾,foldclose:▸,vert:\|
set foldcolumn=1 " 設定 fold 左欄提示
set signcolumn=number
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,
set showbreak=↪

set clipboard=unnamedplus	"yank to the system register (*) by default  " work on xlaunch
set noshowmatch		" Cursor no shows matching ) and }
set showmode		" Show current mode
set wildmenu    " wild char completion menu

set nrformats-=octal " <c-a> <c-x> use

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" disable bell on all case
set belloff=all
set t_vb=
set t_SH=

" --- move around splits {
set wmw=0         " set the min width of a window to 0 so we can maximize others 
set wmh=0         " set the min height of a window to 0 so we can maximize others
" }
" complete fast
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

set secure
" statusline
set laststatus=2
set statusline=%-15f%h%m%r%w%=[%{&fileencoding}]%-6y--%p%%[%l/%L]
" File ,Help, Modify, Readonly w:Preview    
" =:right     y:filetype,  lLine , Percent

filetype indent on
filetype plugin on
syntax on

if has('gui')
  let $VIMFILES=$HOME..'/vimfiles'
  set guifont=Cascadia\ Code:h11:cANSI
  " maxmum window
  au GUIEnter * simalt ~x
else
  let $VIMFILES=$HOME..'/.vim'
endif

" hilight current line only
augroup CursorLine
    au!
    au WinEnter * setlocal cursorline 
    au WinLeave * setlocal nocursorline 
augroup END

autocmd TerminalOpen * setlocal nonumber norelativenumber

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained * checktime

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python
" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" remove trailing whitespace
" autocmd BufWritePre *.py :%s/\s\+$//e

" augroup remember_view_global
"   au!
  " au BufWinLeave $VIMFILES/vimrc mkview! $VIMFILES/view/~=+vimrc=
  " au BufWinEnter $VIMFILES/vimrc silent! source $VIMFILES/view/~=+vimrc= 
  " au BufWinLeave *.ft mkview
  " au BufWinEnter *.ft loadview
" augroup END


" text object
source $VIMFILES/script/text-obj.vim


"####################  command ##################### 
" change pwd to dir which current file locate
command! LCD lcd %:p:h
command! CD cd %:p:h
" 使用記事本的ANSI編碼來查看目前檔案, 一般vim使用utf-8來查看當前檔案

command! ANSI e ++enc=cp950 
" open terminal window with using current buffer window

command! Url call system( 'explorer.exe ' . getline('.') )

" open csv file format
command! -complete=file -nargs=1 Csv tabe| .!column -s, -t <args>

" put now time
command! Now execute 'normal! i ' ."\<c-r>=strftime('%H:%M:%S')\<cr>"

" put the output of command, e.g. PutCommand map, show all the mapping keys
command! -nargs=+ PutCommand put =execute( '<args>')

" delete file command
command! -complete=file -nargs=1 Delete 
      \if delete(<f-args>)==0 | 
      \echo "delete" <f-args> | 
      \else | echo <f-args> "not exist" | endif

" run command without "hit to continue"
command! -nargs=+ CmdSilent
\   execute 'silent !'.. '<args>'
\ | execute 'redraw!'


"  unix like command,  mv the current file name
command! -nargs=1 -complete=file -bang Mv file <args>|w<bang>

" when :tab term, the cursor wont change
if &term =~ '^xterm'
	" normal mode
	let &t_EI = "\<Esc>[0 q"
	" insert mode
	let &t_SI = "\<Esc>[5 q"
  " visual mode
  let &t_SR = "\<Esc>[4 q"
endif

" if empty($TMUX)
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"   let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" else
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" endif



"source map
source $VIMFILES/after/commonMap.vim

"confugure
source $VIMFILES/after/configure.vim

" vim-plug
source $VIMFILES/after/plug.vim

let folddigest_options = "vertical,flexnumwidth"
let folddigest_size = 30


" remote server
command! KDD tab terminal ++close ssh siuoly@140.118.46.94 -p 2222
