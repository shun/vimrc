function! s:report_startup_time() abort
  if !exists('g:rc_start_time')
    return
  endif

  if exists('*reltimefloat')
    let l:elapsed_ms = reltimefloat(reltime(g:rc_start_time)) * 1000.0
    echomsg printf('Startup: %.1f ms', l:elapsed_ms)
  else
    echomsg 'Startup: ' .. reltimestr(reltime(g:rc_start_time))
  endif

  unlet g:rc_start_time
endfunction

augroup RcStartupTime
  autocmd!
  if exists('*timer_start')
    autocmd VimEnter * call timer_start(100, {-> s:report_startup_time()})
  else
    autocmd VimEnter * call s:report_startup_time()
  endif
augroup END
