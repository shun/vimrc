" 外部更新の自動検知
augroup AutoRead
  autocmd!
  autocmd FocusGained,BufEnter *
        \ if mode() !=# 'c' | checktime | endif
  autocmd FileChangedShellPost *
        \ echohl WarningMsg
        \ | echomsg 'File changed on disk. Buffer reloaded.'
        \ | echohl None
augroup END
