highlight htmlBold ctermfg=blue
highlight htmlItalic cterm=italic ctermfg=yellow
highlight htmlBoldItalic cterm=italic ctermfg=blue
highlight CursorLineNr guifg=gray



" copy from https://github.com/frenchtoasters/dotfiles/blob/0d421fed6fd703bd9ca278cbe36ddce2af331c10/colors/toast.vim
" Terminal Colors {{{
if has('nvim')
  let g:terminal_color_1  = "#D12D00"
  let g:terminal_color_2  = "#427B00"
  let g:terminal_color_3  = "#B68200"
  let g:terminal_color_4  = "#006fd1"
  let g:terminal_color_5  = "#a53bce"
  let g:terminal_color_6  = "#119c97"
  let g:terminal_color_9  = "#E74D23"
  let g:terminal_color_10 = "#7dc030"
  let g:terminal_color_11 = "#ffc233"
  let g:terminal_color_12 = "#5aa2e0"
  let g:terminal_color_13 = "#b968d9"
  let g:terminal_color_14 = "#15c1bb"

  if &background == "light"
    let g:terminal_color_0  = "#323434"
    let g:terminal_color_7  = "#e4e2d8"
    let g:terminal_color_8  = "#4f4a36"
    let g:terminal_color_15 = "#f4f3ef"
  else " &background == 'dark'
    let g:terminal_color_0  = "#1e2d38"
    let g:terminal_color_7  = "#acc1d3"
    let g:terminal_color_8  = "#253846"
    let g:terminal_color_15 = "#b9cbda"
  endif
else
  let g:terminal_ansi_colors = repeat([0], 16)
  let g:terminal_ansi_colors[1]  = "#D12D00"
  let g:terminal_ansi_colors[2]  = "#427B00"
  let g:terminal_ansi_colors[3]  = "#B68200"
  let g:terminal_ansi_colors[4]  = "#006fd1"
  let g:terminal_ansi_colors[5]  = "#a53bce"
  let g:terminal_ansi_colors[6]  = "#119c97"
  let g:terminal_ansi_colors[9]  = "#E74D23"
  let g:terminal_ansi_colors[10] = "#7dc030"
  let g:terminal_ansi_colors[11] = "#ffc233"
  let g:terminal_ansi_colors[12] = "#5aa2e0"
  let g:terminal_ansi_colors[13] = "#b968d9"
  let g:terminal_ansi_colors[14] = "#15c1bb"

  if &background == "light"
    let g:terminal_ansi_colors[0]  = "#323434"
    let g:terminal_ansi_colors[7]  = "#e4e2d8"
    let g:terminal_ansi_colors[8]  = "#4f4a36"
    let g:terminal_ansi_colors[15] = "#f4f3ef"
  else " &background == 'dark'
    let g:terminal_ansi_colors[0]  = "#1e2d38"
    let g:terminal_ansi_colors[7]  = "#acc1d3"
    let g:terminal_ansi_colors[8]  = "#253846"
    let g:terminal_ansi_colors[15] = "#b9cbda"
  endif
endif
" }}}
