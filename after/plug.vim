
" Reload .vimrc and ":PlugInstall" to install plugin 
"vim-plug

" Profile https://github.com/hyiltiz/vim-plugins-profile

call plug#begin( '~/.vim/plugged' )
" no use
" Plug 'bling/vim-bufferline'
" Plug 'maxbrunsfeld/vim-yankstack'   " 複製暫存器
" Plug 'kien/ctrlp.vim'               " 搜尋buffer
" Plug 'preservim/tagbar'               " taglist
" Plug 'siuoly/YankRing.vim'            " yankring
" Plug 'jceb/vim-orgmode'               "Todo list
" Plug 'lifepillar/vim-cheat40'         "Todo list
" Plug 'ashisha/image.vim'             " open ASCII image in vim
" Plug 'easymotion/vim-easymotion'
" Plug 'godlygeek/tabular'           " h Tabu  快速編輯
" Plug 'pi314/ime-phonetic.vim'
" Plug 'pi314/ime.vim'
if !has('win32') |
  " Plug 'brglng/vim-im-select'           " IME switch
endif


" must use
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align' " align 
" Plug 'frazrepo/vim-rainbow' " 括號顏色
Plug 'kana/vim-textobj-user' "text object custom
Plug 'machakann/vim-highlightedyank' "high light yank
Plug 'siuoly/vim-misc' 
Plug 'markonm/traces.vim'
Plug 'Yggdroot/indentLine'  " 縮排小線
Plug 'tpope/vim-commentary',
     ""\{'on':['<plug>Commentary','<plug>CommentaryLine','Commentary'] } " comment
Plug 'suy/vim-context-commentstring',
Plug 'preservim/nerdtree',
     \{ 'on':  'NERDTreeToggle' } " 檔案瀏覽
Plug 'tpope/vim-surround'          " new help surround
Plug 'tpope/vim-repeat'           " surround repeat
Plug 'mattn/emmet-vim',{'for':['html','php']} "html tag
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'tmhedberg/SimpylFold'

" " Track the engine.
Plug 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" not must use"
Plug 'unblevable/quick-scope'
Plug 'haya14busa/vim-asterisk' " start search 
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'turbio/bracey.vim' , {'do': 'npm install --prefix server','for':['html','javascript','css','php']}
                                        " html edit
Plug 'junegunn/goyo.vim',{'on': 'Goyo'} " 小黑屋模式
Plug 'alvan/vim-closetag'               " html tag use
Plug 'siuoly/vim-terminal-help'     " terminal
Plug 'kshenoy/vim-signature'            " mark
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop'] }
Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask', 'AsyncTaskMacro', 'AsyncTaskList', 'AsyncTaskEdit'] }

" Plug 'puremourning/vimspector' "debugger
Plug 'neoclide/coc.nvim', {'branch': 'release','on':[]}
Plug 'yianwillis/vimcdoc'             " 中文vim help
Plug 'flazz/vim-colorschemes'         " color scheme
" Plug 'yegappan/taglist',{'on':'Tlist'}               " taglist


" Plug 'jupyter-vim/jupyter-vim',{'for':'python'} " jupyter 互動工作
" Plug 'goerz/jupytext.vim'
Plug 'hanschen/vim-ipython-cell',{'for':'python'}
Plug 'jpalardy/vim-slime',{'for':'python','on':'SlimeConfig'}

" Plug 'untitled-ai/jupyter_ascending.vim'


" Plug 'iamcco/dict.vim'
Plug 'plasticboy/vim-markdown' " markdown
Plug 'siuoly/md-img-paste.vim'  " my fork,  paste the markdown image
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " preview
" Plug 'siuoly/typing_speed.vim'


" Plug 'vim-airline/vim-airline'        " 美觀
" Plug 'vim-airline/vim-airline-themes' " theme
" Plug 'kyoz/purify', { 'rtp': 'vim' }  " color scheme
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


if( has_key(g:plugs, "vim-asterisk" ) )
  map *  <Plug>(asterisk-z*)
  map #  <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)
endif

if( has_key(g:plugs, "vim-easy-align") )
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
endif

if( has_key(g:plugs, "vim-rainbow") )
  let g:rainbow_active = 1
endif

if( has_key(g:plugs, "vim-markdown") )
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_math = 1
  let g:vim_markdown_conceal_code_blocks = 0
  let g:tex_conceal = ""
endif

if( has_key(g:plugs, "markdown-preview.nvim") )
  let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
endif


if( has_key(g:plugs, "vim-commentary") )
  nmap gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine
  xmap gc  :Commentary <bar> normal! gv<cr>
  nmap  <Plug>CommentaryLine
  xmap  :Commentary <bar> normal! gv<cr>
  " omap gc  <Plug>Commentary
  " nmap gcp <Plug>Commentaryip}
endif

if( has_key(g:plugs, "vim-im-select") )
  " im-select
  let g:im_select_default = '1033'
  let g:im_select_get_im_cmd = ['im-select.exe']
  let g:im_select_command = '/usr/local/bin/im-select.exe'
  "set noesckey  " function key eg. <F5> <F4> ,cursor key couldn't using
  " but can make Insetereave event fastly, needn't wait 1 sec
  set ttimeoutlen=5
  let g:im_select_enable_focus_events = 0 " i-mode <C-O> will switch IME
endif

if(has_key(g:plugs, "goyo.vim") )
  let g:goyo_width = 100
endif

"taglist
let Tlist_Enable_Fold_Column = 0
"let Tlist_Close_On_Select = 1
let g:user_emmet_leader_key='<M-,>'

"easy-motion
if( has_key(g:plugs, "vim-easymotion") )
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  map <space> <Plug>(easymotion-overwin-f)
endif

"----------- COS setting ---------------------
"coc.nvim  "https://github.com/junegunn/vim-plug/wiki/tips
augroup load_us_coc   " lazy load
  autocmd!  
  autocmd InsertEnter * call plug#load('coc.nvim') | autocmd! load_us_coc
  autocmd CursorHold * call plug#load('coc.nvim') | autocmd! load_us_coc
augroup END

if( has_key(g:plugs, "coc.nvim") )
  source $VIMFILES/after/cocset.vim
  let g:coc_node_path="/usr/bin/node"
  let g:coc_global_extensions = [ "coc-pyright"]
  nnoremap <leader>c :tabe <bar>CocConfig<cr>
endif

" vim-terminal-help
if( has_key( g:plugs, "vim-terminal-help") )
  let g:terminal_close=1  "自動關閉shell
  let g:terminal_list=0   " 避免buffer跳轉遇到
  let g:terminal_height=10   " terminal window height
  let g:terminal_kill='hup'  " 離開時 自動關閉終端

" terminal switch and zoom in/out
" 1. move ter win,           2.switch normal mode 
" 3.resize max line height   4.move previous position 
" using exec for using &terminal_height key
  " se termwinkey=<c-_>
  " tnoremap <m-w> <Cmd>wincmd p<cr>
  " nnoremap <expr><m-w> &bt == "" ? "<Cmd>call JumpTerminalWin()<cr>" :"<Cmd>p"
  tnoremap <m-q> <Cmd>q<cr>
endif


" colorschemes
if( has_key(g:plugs, "vim-colorschemes") )
  " colorscheme Atelier_SeasideDark
  colorscheme blues
  " 游標行的背景色,  註解斜體字
  hi CursorLine   ctermbg=234 
  hi CursorColumn ctermbg=234
  hi Comment cterm=italic
endif

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" asyncrun setting
if( has_key(g:plugs, "asyncrun.vim") )
  " trans, pip install googletrans==a3.0, 
  " zshrc: alias translate_stdin="xargs -0 -I {} translate {}"
  nnoremap gsg :cclose<cr>
  " nnoremap gss :AsyncRun -cwd=$VIMFILES/script ./translateZH_TW.py <cword><CR>
  " xnoremap gss :AsyncRun -cwd=$VIMFILES/script ./translateZH_TW.py -<CR>
  command! -nargs=* Translate AsyncRun -cwd=$VIMFILES/script ./translateZH_TW.py <q-args>

  nnoremap gse :AsyncRun translate <cword><CR>
  xnoremap gse :AsyncRun cat \| xargs -0 -I {} translate {}<CR>

  " pronounciation,  copy the mpg123.exe to windows System path
  nnoremap <silent>gsd :AsyncRun -mode=term -pos=hide gtts-cli <cword> \| mpg123.exe -q - <cr>
  xnoremap gsd :AsyncRun -silent gtts-cli - \| mpg123.exe -q - <cr>
  command! -nargs=* Pronunce AsyncRun -silent gtts-cli <q-args> | mpg123.exe -q -

endif

" asynctask setting
if( has_key(g:plugs, "asynctasks.vim") )
  let g:asyncrun_open = 8
  " nnoremap <space>d :AsyncTask file-run<cr>
  nnoremap <c-c> :AsyncStop<cr>
  nnoremap <leader>g :call Togglefile('.tasks')<cr>
  command! AE  if(filereadable(".tasks")) | vs .tasks | else | exec "AsyncTaskEdit" | endif

  nnoremap <expr><F5> &bt=="" ? "<Cmd>call JumpQuickfixWin() <bar> ZoomToggle<cr>" : ":ZoomToggle<CR><C-w><c-p>"

  
  nnoremap <leader>G :call Togglefile( $VIMFILES .. '/tasks.ini')<cr>
endif

  " terminal setting
  let g:asynctasks_term_pos = 'bottom'  " term pos
  let g:asynctasks_term_rows = 10   " width"
  let g:asynctasks_term_reuse = 1   " reuse same term? 
  let g:asynctasks_term_focus = 1   " focus origin?
  " let g:asynctasks_term_pos = 'tab'

  function! JumpQuickfixWin()
    for i in tabpagebuflist()
      if getbufvar(i, "&buftype") == "quickfix" | exec bufwinnr(i) ."wincmd w" | endif
    endfor
  endfunction

if( has_key(g:plugs, "ultisnips") ) 
  nnoremap \u  <Cmd>UltiSnipsEdit<cr><c-^><Cmd>tabe #<cr>
  let g:UltiSnipsExpandTrigger = "<c-l>"
  inoremap <expr> <space> UltiSnips#CanExpandSnippet()? "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>":" "
  xnoremap <expr> <space> UltiSnips#CanExpandSnippet()? "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>":" "
  command! SnipRefresh call UltiSnips#RefreshSnippets() 
endif


let g:UltiSnipsListSnippets='<c-j>'
let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"term_finish": "close"}
let g:slime_vimterminal_cmd = 'ipython'
let g:slime_no_mappings = 1


let g:ime_plugins = ['zhuyin']
let g:ime_show_2nd_mode = 0
let g:ime_select_mode_style = 'popup'
let g:ime_phonetic_cache_size = 2000

source $VIMFILES/script/TranslateWord.vim



