let g:idaten_config = expand('<sfile>:p:h:h:h') .. '/rc/plugins/idaten/idaten.ts'

" Use local version for development
let g:idaten_repo_path = '~/ghq/github.com/shun/idaten.vim'

" Resolve the idaten path and bootstrap
function! s:IdatenSetup() abort
  " Determine base cache directory (prefer XDG_CACHE_HOME)
  let l:cache_base = !empty($XDG_CACHE_HOME) ? $XDG_CACHE_HOME : expand('~/.cache')
  let l:idaten_dir = expand(get(g:, 'idaten_dir', l:cache_base .. '/idaten'))
  
  " Resolve the actual repository path
  let l:repo = expand(get(g:, 'idaten_repo_path', l:idaten_dir .. '/repos/github.com/shun/idaten.vim'))
  
  execute 'set runtimepath^=' .. fnamemodify(l:repo, ':p')
  call idaten#Bootstrap()
endfunction

call s:IdatenSetup()
