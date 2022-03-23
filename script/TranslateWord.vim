function! Translate( text, ... )
  " default translate to chinese (ZH-TW)
  let dest = get(a:,1,'zh-TW') 
python3 << E
import vim
from googletrans import Translator
text =  vim.eval('a:text')
dest =  vim.eval('dest')  # destion language
newtext = Translator().translate( text, dest = dest , src='en' ).text
vim.command("let ret = \"" + newtext + '"' )
E
echo a:text .. ' --> ' .. ret
return ret
endfunction

nnoremap <silent> gss :call Translate(expand('<cword>'))<cr>
nnoremap gsS yiwea(<c-r>=Translate(@")<cr>)<esc>
xnoremap <silent> gss y:call Translate(@")<cr>
xnoremap <silent> gsS y`>a(<c-r>=Translate(@")<cr>)<esc>

let t = "I often find myself wanting to replace one word with another that I have yanked from elsewhere."
" call Translate('hello world')
" call Translate('hello world','zh-TW')
" call Translate('你好世界','en')
