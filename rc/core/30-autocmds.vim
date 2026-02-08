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

function! s:copy_messages_to_clipboard() abort
  redir => l:messages
  silent messages
  redir END

  let l:messages = substitute(l:messages, '^\n\+', '', '')
  if empty(l:messages)
    echomsg 'No messages to copy.'
    return
  endif

  for l:register in ['+', '*']
    try
      call setreg(l:register, l:messages)
      echomsg 'Copied :messages to clipboard.'
      return
    catch /^Vim\%((\a\+)\)\=:E/
    endtry
  endfor

  echohl WarningMsg
  echomsg 'Clipboard register is not available.'
  echohl None
endfunction

command! MessagesCopy call s:copy_messages_to_clipboard()
