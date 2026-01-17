let g:rc_start_time = reltime()

let s:rc = expand('<sfile>:p:h') . '/rc/vimrc'
if filereadable(s:rc)
  execute 'source' fnameescape(s:rc)
endif
