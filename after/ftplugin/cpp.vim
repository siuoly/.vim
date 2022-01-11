

"setlocal makeprg=c++\ -g\ -Wall\ -Wextra\ %\ &&./a.out
" nnoremap <buffer> <C-D> :w<CR>:!c++ % -std=c++2a -I ~/projects/c++/Tool/ &&  ./a.out<CR>
" nnoremap <buffer> <C-C> :w<CR>:!c++ -std=c++2a -g -pedantic -Wfatal-errors -w -DDEBUG % -I ~/projects/c++/Tool/ &&./a.out<CR>
nnoremap <buffer><expr> <m-d> ':w<cr>'.expandcmd(':H c++ % -std=c++2a -I ~/projects/c++/Tool/ && ./a.out<cr>')


" \M setting
" setting hot key
let makeset = 0
nnoremap \M :call Setmakemap( makeset )<CR>:let makeset= xor(makeset, 1)<CR>:echo "makeset = "makeset<CR>

function Setmakemap( makeset )
	if a:makeset == 0
		nmap <C-D> <Esc>:wall<CR>:make!<CR>
		nmap <C-C> <Esc>:wall<CR>:make! debug<CR>
	else
		call Remap()
	endif
endfunction

"
" run a paragraph code
nnoremap <buffer><silent><m-s> :call RunBlockCode()<cr>
" function definition at bottom
" auto delete the c++ template file
autocmd! VimLeave *.cc call delete('t.cc')
"----------------------------------------------------------------------------------------------------



"cppman open manpage for c++
":help Terminal-mode for switch mode
nnoremap <buffer><silent> K :tab term ++shell ++close man <cWORD> \|\|  cppman <cWORD><CR>


"fold quickly
" nnoremap zf zfaB
nnoremap zip vipzf

"abbreviation
iabbr sin std::cin >>
iabbr send std::endl
iabbr UNS using namespace std
iabbr UNT using namespace Tool
iabbr UNL using namespace std::literals;
iabbr UNCL using namespace std::chrono_literals;
iabbr UNSL using namespace std::string_literals;
iabbr tem template< ><left><left>

iabbr sss<<	std::ostream& operator<<(std::ostream& os,const & ){ os << ;  return os; }

"inoremap dw dW
iabbr <buffer> //c /* */<Left><Left><Left>
iabbr <buffer> #i #include
iabbr <buffer> #d #define
iabbr <buffer> #e #endif
iabbr <buffer> #f #ifdef

" jump and zz
" inoremap <buffer> {{ {<CR>}<C-O>O
nmap `' `'zz
nmap `` ``zz

" command \"cout\" in a block { .... }
nnoremap gcb viB:g/cout\\|cerr/Commentary<CR>
nnoremap gca viB:g/assert/Commentary<CR>



"recorrect input
iabbr itn int
iabbr retrun return 

"move between function
nmap [m [[?\(){$\)\\|\()$\n\t*{\)
"nmap ]m 
" noremap [[ ?{<CR>w99[{
" nmap ]] j0[[%//{<CR>
noremap ( [(
noremap ) ])
" noremap { 99[{
" noremap } 99]}

"omap
onoremap w iw
onoremap b ib
onoremap B iB

"search path
set path+=/usr/include/c++/9,/usr/include/linux,/usr/include/x86_64-linux-gnu/c++/9,/usr/include/x86_64-linux-gnu,~/projects/c++/Tool

" OmniCppComplete initialization
" call omni#cpp#complete#Init()
"let OmniCpp_MayCompleteDot = 0
"let OmniCpp_MayCompleteArrow = 0
" set completeopt=menu


if exists("*RunBlockCode")   "prevent redefine
  finish
endif

function! RunBlockCode()
  "copy current file header to template file
  1,/main/ write! t.cc

  "select paragraph 
  exec "normal vip\<esc>" 

  "write to tempfile
  '<,'>write! >> t.cc

  "compile and run code
  H echo '\n}'>> t.cc && g++ -I ~/projects/c++/Tool/ t.cc && ./a.out
endfunc

