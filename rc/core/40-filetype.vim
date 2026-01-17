let s:ft_dir = expand('<sfile>:p:h:h') . '/ft'

function! s:source_ft() abort
  if &l:filetype ==# ''
    return
  endif

  let l:ft_file = s:ft_dir . '/' . &l:filetype . '.vim'
  if filereadable(l:ft_file)
    execute 'source' fnameescape(l:ft_file)
  endif
endfunction

augroup MyRcFiletype
  autocmd!
  autocmd FileType * call s:source_ft()
augroup END
