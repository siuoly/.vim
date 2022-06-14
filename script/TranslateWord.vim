
function! Translate( text,... )
  " destination language, default is chinese (ZH-TW), or indicate other language
  let dest = get(a:,1,'zh-TW') 
python3 << EOF
import vim
from googletrans import Translator
if 'GoogleTranslator' not in dir(): # prevent recreating translator object, may faster ?
  GoogleTranslator = Translator()
text =  vim.eval('a:text')
dest =  vim.eval('dest')  # destination language
newtext = GoogleTranslator.translate( text, dest = dest ).text
EOF
  return py3eval("newtext") "return the translated text from python
endfunction


" nnoremap <silent> gss :echo expand('<cword>') .. ' --> ' .. Translate(expand('<cword>'))<cr>
" xnoremap <silent> gss y`>:echo @" .. " --> " .. Translate(@")<cr>
nnoremap gsS yiwea(<c-r>=Translate(@")<cr>)<esc>
xnoremap <silent> gsS y`>a(<c-r>=Translate(@")<cr>)<esc>

nnoremap <silent> gse :echo expand('<cword>') .. ' --> ' .. Translate(expand('<cword>'),'en')<cr>
xnoremap <silent> gse y`>:echo @" .. " --> " .. Translate(@",'en')<cr>
nnoremap gsE yiwea(<c-r>=Translate(@",'en')<cr>)<esc>
xnoremap <silent> gsE y`>a(<c-r>=Translate(@",'en')<cr>)<esc>

" let t = "I often find myself wanting to replace one word with another that I have yanked from elsewhere."
" call Translate('hello world')
" call Translate('hello world','zh-TW')
" call Translate('你好世界','en')
"
" 這是美好的一天(This is a good day)
"
" 一開始其實是先寫中文，接著再改成英文。因為如果不這樣寫，我會想不到應該要寫什麼。在寫這個履歷之前，其實 Linkedin 上面的 Profile 就已經是英文了，所以有很多部分都直接從上面抄下來改一改

