"1y 複製
.  連續複製

"1p 貼上
.   連續貼上


" 1 為本地目錄 設置單獨 configure
$HOME/.vimrc
  set exrc  "讀取本地 .vimrc  .exrc
  set secure  "安全 防止autocmd !cmd

.../WC/.vimrc " 工作目錄
  load   "使得當前目錄所有自動讀取 其view 檔案

.../WC/file "檔案
  :mkvie  "設置view

" 2 為本地目錄 設置單獨 configure
  :mk  "設置 .exrc
  :mkv "設置 .vimrc


" 為單獨檔案設置view
  :mkvie
  :lo
                  
