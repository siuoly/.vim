" Reload .vimrc and ":PlugInstall" to install plugin 
"vim-plug

" Profile https://github.com/hyiltiz/vim-plugins-profile

call plug#begin( '~/.vim/plugged' )
" no use
" if !has('win32') |
"   Plug 'brglng/vim-im-select'           " IME switch
" endif
" Plug 'maxbrunsfeld/vim-yankstack' " 複製暫存器
" Plug 'kien/ctrlp.vim'             " 搜尋buffer
" Plug 'preservim/tagbar'           " taglist
" Plug 'siuoly/YankRing.vim'        " yankring
" Plug 'jceb/vim-orgmode'           " Todo list
" Plug 'lifepillar/vim-cheat40'     " Todo list
" Plug 'ashisha/image.vim'          " open ASCII image in vim
" Plug 'easymotion/vim-easymotion'
" Plug 'pi314/ime-phonetic.vim'
" Plug 'pi314/ime.vim'

" must use
Plug 'tpope/vim-fugitive'           " git integrate
Plug 'wellle/context.vim'            " context look
Plug 'rhysd/clever-f.vim'            " f,F,t,T move quickly
Plug 'terryma/vim-multiple-cursors'  " <c-n> multiple select
" Plug 'RRethy/vim-illuminat'          " highlight current, coc have same feature
Plug 'junegunn/vim-easy-align'       " align
Plug 'machakann/vim-highlightedyank' " high light yank
Plug 'lfv89/vim-interestingwords'    " highlight select word
Plug 'kana/vim-textobj-user'         " text object custom
Plug 'siuoly/vim-misc' 
Plug 'markonm/traces.vim'            " 預覽 :s/xxxx/yyyy 命令
Plug 'Yggdroot/indentLine'           " 縮排虛線
Plug 'tpope/vim-commentary',         " 註解 快速鍵
Plug 'suy/vim-context-commentstring', " 根據游標所在區域類型註解
Plug 'preservim/nerdtree',
     \{ 'on':  'NERDTreeToggle' }             " 檔案瀏覽
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'                     " new help surround
Plug 'tpope/vim-repeat'                       " surround repeat
Plug 'mattn/emmet-vim',{'for':['html','php']} " html tag
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'michaeljsmith/vim-indent-object'        " vii, vai 選擇 縮排區塊
" Plug 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
" Plug 'frazrepo/vim-rainbow' " 括號顏色
" Plug 'tmhedberg/SimpylFold'


" not must use
" Plug 'AndrewRadev/sideways.vim'                                          " 左右移動 參數文字 方便
Plug 'airblade/vim-rooter' " working directory
Plug 'dstein64/vim-startuptime'                                          " 計算啟動vim花費時間, :StratupTime
Plug 'webdevel/tabulous'                                                 " tabpage bar custom
Plug 'haya14busa/vim-asterisk'                                           " start(*) search
Plug 'voldikss/vim-floaterm'
Plug 'kshenoy/vim-signature'                                             " mark
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'turbio/bracey.vim' 
      \,{'do': 'npm install --prefix server', 
      \'for':['html','javascript','css','php']}                          " html edit
Plug 'junegunn/goyo.vim',{'on': 'Goyo'}                                  " 小黑屋模式
Plug 'alvan/vim-closetag'                                                " html tag use
Plug 'skywind3000/asyncrun.vim'                                          " , {'on': ['AsyncRun', 'AsyncStop'] }
Plug 'voldikss/vim-translator'

" Plug 'siuoly/vim-terminal-help'                                          " terminal
" Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask', 'AsyncTaskMacro', 'AsyncTaskList', 'AsyncTaskEdit'] }
Plug 'yianwillis/vimcdoc'                                                " 中文vim help
Plug 'flazz/vim-colorschemes'                                            " color scheme
Plug 'hanschen/vim-ipython-cell',{'for':'python'}
Plug 'jpalardy/vim-slime',{'for':'python','on':'SlimeConfig'}
Plug 'plasticboy/vim-markdown'                                           " markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " preview
" Plug 'siuoly/md-img-paste.vim' ,{ 'for': 'markdown' }                     " my fork,  paste the markdown image

" Plug 'ap/vim-css-color', { 'for': ['html', 'css'] } " preview css color on vim
" Plug 'RRethy/vim-hexokinase'  " 輕量化的 css color
" Plug 'puremourning/vimspector' "debugger
" Plug 'yegappan/taglist',{'on':'Tlist'} " taglist
" Plug 'jupyter-vim/jupyter-vim',{'for':'python'} " jupyter 互動工作
" Plug 'goerz/jupytext.vim'
" Plug 'untitled-ai/jupyter_ascending.vim'
" Plug 'iamcco/dict.vim'
" Plug 'siuoly/typing_speed.vim'
" Plug 'vim-airline/vim-airline'        " 美觀
" Plug 'vim-airline/vim-airline-themes' " theme

" Language Server
" Plug 'davidhalter/jedi-vim' " python lsp
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/vim-lsp'
Plug 'liuchengxu/vim-clap'  " , { 'do': { -> clap#installer#force_download() } }  finder with cache feature
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
" Plug 'dense-analysis/ale'  " lsp

call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:context_add_mappings = 0

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


if( has_key(g:plugs, "vim-misc") )
  nnoremap <f4> <Cmd>ZoomToggle<cr>
endif

if( has_key(g:plugs, "indentLine") )
let g:indentLine_bufTypeExclude = ['help']
let g:indentLine_fileType = ['c', 'cpp', 'python', 'javascript']
let g:indentLine_char='▏' " You can also use one of ¦, ┆, │, ⎸, or ▏ 
autocmd TerminalOpen * IndentLinesDisable
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

if( has_key(g:plugs, 'fzf.vim' ) )
  nnoremap <m-H> :Helptag<cr>
endif

if( has_key(g:plugs, "vim-interestingwords") )
  let g:interestingWordsDefaultMappings = 0
  " nnoremap <silent> * :call InterestingWords('n')<cr>
  " vnoremap <silent> * :call InterestingWords('v')<cr>
  command! -range Hi 
        \if (<count>==-1) | 
        \call InterestingWords('n') |  
        \else | call InterestingWords('v') | endif
  command! HiClear call UncolorAllWords()
  nnoremap <silent> n :call WordNavigation(1)<cr>
  nnoremap <silent> N :call WordNavigation(0)<cr>
  " <shift>8 --> *  | <alt>8 --> Hi 
  nnoremap <m-8> :call InterestingWords('n')<cr>
  xnoremap <m-8> :Hi<cr>
endif

if( has_key(g:plugs, "sideways.vim") )
  nnoremap <m-H> :SidewaysLeft<cr>
  nnoremap <m-L> :SidewaysRight<cr>
endif

if( has_key(g:plugs, "LeaderF") )  " TODO add file history
  nnoremap <m-g> :Leaderf rg --type py<cr>
  nnoremap <m-G> <Plug>LeaderfRgBangCwordLiteralBoundary
endif
if( has_key(g:plugs, "vim-clap") )  " TODO add file history
  nnoremap <m-o> <Cmd>Clap files<cr>
  nnoremap <m-p> <Cmd>Clap<cr>
  nnoremap <m-i> <Cmd>Clap oldfiles<cr>
  nnoremap <m-b> <Cmd>Clap buffers<cr>
  tnoremap <m-b> <Cmd>Clap buffers<cr>
  let g:clap_preview_direction = 'UP'
  let g:clap_layout = { 'width': '80%', 'height': '60%', 'row': '10%', 'col': '10%','relative':'editor'}
  let g:clap_preview_size=3
  let g:clap_popup_border='nil'
  let g:clap_provider_tags_force_vista = 1
  let g:clap_theme = 'material_design_dark'
  " let g:clap_open_preview = 'never'
  function! On_move()
    let cur_line = g:clap.display.getcurline()
    call g:clap.preview.show(  )
  endfunction
  let g:clap_provider_oldfiles = {
        \ 'source':  {-> v:oldfiles},
        \ 'sink': 'e' ,
        \ 'on_move' : function('clap#provider#files#on_move_impl'),
        \ 'description': 'jumps to the old files',
        \ }
  " let g:clap_provider_snip = {
  "       \ 'source': 'ls -d '..$VIMFILES..'/UltiSnips/*', 
  "       \ 'sink': 'e' ,
  "       \ 'on_move' : function('clap#provider#files#on_move_impl'),
  "       \ 'description': 'jumps to the snipfile ',
  "       \ }
  let g:clap_provider_vim = {
        \ 'source': 'ls  ~/.vim/**/*.vim' ,
        \ 'sink': 'e' ,
        \ 'description': 'diaplay ~/.vim directory',
        \ }
  let g:clap_provider_make = {
        \ 'source': "make -qpRr | egrep -e '^[a-z].*:$$' | sed -e 's~:~~g' | sort", 
        \ 'sink': 'make! ' ,
        \ 'description': 'show make file command',
        \ }
        " \ 'on_move_async' : function('clap#impl#on_move#async'),
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

if(has_key(g:plugs, "goyo.vim") )
  let g:goyo_width = 100
endif

"taglist
let Tlist_Enable_Fold_Column = 0
"let Tlist_Close_On_Select = 1
let g:user_emmet_leader_key='<M-,>'

if( has_key(g:plugs,'nerdtree') ) 
nnoremap <leader>e :NERDTreeToggle<CR>
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
  " colorscheme blues
  " set background=dark
  " colorscheme Atelier_SeasideDark
  colorscheme OceanicNext
  " 游標行的背景色,  註解斜體字
  hi CursorLine   term=None cterm=None ctermbg=237 guibg=#1b2b34
  " hi CursorColumn ctermbg=234
  " hi Comment cterm=italic
  " hi foldcolumn ctermfg=red ctermbg=None
  hi Folded ctermbg=None cterm=italic guibg=NONE
  source $VIMFILES/after/highlight.vim
endif

if( has_key(g:plugs, "vim-markdown") )
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_math = 1
  let g:vim_markdown_conceal_code_blocks = 0
  let g:tex_conceal = ""
  let g:vim_markdown_strikethrough = 1 "enable strikethrough ~~xx~~
endif

"----------- COS setting ---------------------
"coc.nvim  "https://github.com/junegunn/vim-plug/wiki/tips
if( has_key(g:plugs, "coc.nvim") )
  augroup load_us_coc   " lazy load
    autocmd!  
    autocmd InsertEnter * call plug#load('coc.nvim') | autocmd! load_us_coc
    autocmd CursorHold * call plug#load('coc.nvim') | autocmd! load_us_coc
  augroup END

  source $VIMFILES/after/cocset.vim
  let g:coc_node_path="/usr/bin/node"
  let g:coc_global_extensions = ["coc-snippets","coc-pairs",
        \"coc-highlight","coc-vimlsp","coc-sumneko-lua", "coc-pyright"]
  nnoremap <leader>C :CocCommand<cr>
  nnoremap <leader>c :tabe <bar>CocConfig<cr>
  hi! link CocBold htmlBold
  hi! link CocItalic htmlItalic
  hi! link CocUnderline Underlined
  hi! link CocStrikeThrough HtmlStrike 
  hi! link CocMarkdownCode String
  hi! link CocMarkdownHeader Title
  hi! link CocMarkdownLink htmlLink
endif

if( has_key(g:plugs, "vista.vim") )
  nnoremap <f7> :Vista!!<cr>
  nnoremap <f8> :Vista finder<cr>
  let g:vista#renderer#enable_icon = 1
endif
" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" hello world ,this is a good day
" asyncrun setting
if( has_key(g:plugs, "asyncrun.vim_no") )
  let g:asyncrun_open = 8
  " trans, pip install googletrans==a3.0, 
  " zshrc: alias translate_stdin="xargs -0 -I {} translate {}"
  " nnoremap gsg :cclose<cr>
  nnoremap gss :AsyncRun -mode=term -focus=0 -rows=2 python $VIMFILES/script/translateZH_TW.py <cword><CR>
  xnoremap gss y:call asyncrun#run('',{'mode':'term', 'focus':0, 'rows':2 ,'cwd': $VIMFILES.."/script" } , "./translateZH_TW.py "..getreg('"') )<cr>
  " xnoremap gss :AsyncRun -cwd=$VIMFILES/script ./translateZH_TW.py -<CR>
  command! -nargs=* Translate AsyncRun  python $VIMFILES/script/translateZH_TW.py <q-args>

  nnoremap gse :AsyncRun translate <cword><CR>
  xnoremap gse :AsyncRun cat \| xargs -0 -I {} translate {}<CR>

  " pronounciation,  copy the mpg123.exe to windows System path
  nnoremap <silent>gsd :AsyncRun -mode=term -pos=hide gtts-cli <cword> \| mpg123.exe -q - <cr>
  xnoremap gsd :AsyncRun -silent gtts-cli - \| mpg123.exe -q - <cr>
  command! -nargs=* Pronunce AsyncRun -silent gtts-cli <q-args> | mpg123.exe -q -
else
  " trans,  pip install googletrans=a3.0
  nnoremap gse :w !translate -d zh-TW <cword><CR>
  xnoremap gse :w !xargs \| xargs -I {} translate -d zh-tw {}<CR>
endif

" rooter
if( has_key(g:plugs, "vim-rooter") )
  let g:rooter_change_directory_for_non_project_files = 'current'
  let g:rooter_patterns= [ '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.vimrc']
endif

" asynctask setting
if( has_key(g:plugs, "asynctasks.vim") )
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
  nnoremap \u  <Cmd>CocCommand snippets.openSnippetFiles<cr>
  " set rtp+=$PWD
  let g:UltiSnipsSnippetDirectories = ['UltiSnips']
  let g:UltiSnipsEditSplit='tabdo'
  let g:UltiSnipsExpandTrigger = 'µ\<Nop>'
  " let g:UltiSnipsListSnippets='<c-j>'
  " inoremap <expr> <space> UltiSnips#CanExpandSnippet()? "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>":" "
  " xnoremap <expr> <space> UltiSnips#CanExpandSnippet()? "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>":" "
  nnoremap <m-u> <Cmd>Snippets<cr>
endif

let g:slime_python_ipython=1
let ipython_cell_cell_command='%paste -q'
let g:slime_default_config = { 'socket_name': 'default', 'target_pane':'{top-right}' }
let g:slime_target = 'tmux'
" let g:slime_target = "vimterminal"
let g:slime_cell_delimiter = "###"
let g:slime_dont_ask_default = 1
" let g:ipython_cell_prefer_external_copy = 1
let g:ipython_cell_send_ctrl_c = 0
let g:ipython_cell_send_ctrl_u = 1
let g:slime_vimterminal_config = {"term_finish": "close"}
" let g:slime_vimterminal_cmd = 'ipython'
let g:slime_no_mappings = 1

source $VIMFILES/script/TranslateWord.vim

