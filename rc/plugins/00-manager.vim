let s:nvim_dir = expand('<sfile>:p:h:h:h')
let s:idaten_dir = ''
" ローカル版を使う場合は次の行を有効化
"let g:idaten_repo_path = '/Users/skudo/ghq/github.com/shun/idaten.vim'



if exists('g:idaten_dir') && !empty(g:idaten_dir)
  let s:idaten_dir = expand(g:idaten_dir)
elseif has('win32') || has('win64')
  let s:idaten_dir = $LOCALAPPDATA .. '/idaten'
elseif has('mac') || has('macunix')
  let s:idaten_dir = expand('~/Library/Caches/idaten')
elseif empty($XDG_CACHE_HOME)
  let s:idaten_dir = expand('~/.cache/idaten')
else
  let s:idaten_dir = $XDG_CACHE_HOME .. '/idaten'
endif

let s:idaten_repo = s:idaten_dir .. '/repos/github.com/shun/idaten.vim'
let s:idaten_repo_url = get(g:, 'idaten_repo_url', 'https://github.com/shun/idaten.vim.git')

if exists('g:idaten_repo_path') && !empty(g:idaten_repo_path)
  let s:idaten_repo_path = expand(g:idaten_repo_path)
  if isdirectory(s:idaten_repo_path)
    let s:idaten_repo = s:idaten_repo_path
  endif
endif

if !isdirectory(s:idaten_repo)
  if get(g:, 'idaten_auto_clone', v:true)
    if executable('git') && !get(g:, 'idaten_repo_clone_tried', v:false)
      let g:idaten_repo_clone_tried = v:true
      if !isdirectory(s:idaten_dir .. '/repos')
        call mkdir(s:idaten_dir .. '/repos', 'p')
      endif
      if !empty(s:idaten_repo_url)
        call system('git clone --depth 1 ' .. shellescape(s:idaten_repo_url) .. ' ' .. shellescape(s:idaten_repo))
      endif
    endif
  endif
endif

if isdirectory(s:idaten_repo)
  execute 'set runtimepath^=' .. fnameescape(s:idaten_repo)
endif

let g:idaten_config = s:nvim_dir .. '/rc/plugins/idaten/idaten.ts'
if !exists('g:idaten_log_enabled')
  let g:idaten_log_enabled = v:true
endif
if !exists('g:idaten_log_path')
  let g:idaten_log_path = '/tmp/idaten'
endif
