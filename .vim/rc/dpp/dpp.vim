const s:dpp_base = $'{$HOME}/.cache/dpp'
const s:dpp_repo = $'{s:dpp_base}/repos/github.com'

const s:dpp_src = $'{s:dpp_repo}/Shougo/dpp.vim'
const s:denops_src = $'{s:dpp_repo}/vim-denops/denops.vim'

execute $'set runtimepath^={s:dpp_src}' 

function SetupPlugin(plugin)
  const repo = $'https://github.com/{a:plugin}'
  const target = expand($'{s:dpp_repo}/{a:plugin}')
  if !isdirectory(l:target)
      silent execute $'!git clone {l:repo}' l:target
  endif
  execute $'set runtimepath^={l:target}'
endfunction

function InitializeDpp()

  const s:preinstallplugins = [
  \  'Shougo/dpp.vim',
  \  'Shougo/dpp-ext-lazy',
  \]

  for s:plugin in s:preinstallplugins
      call SetupPlugin(s:plugin)
  endfor

  const s:plugins = [
  \  'Shougo/dpp-ext-installer',
  \  'Shougo/dpp-ext-local',
  \  'Shougo/dpp-ext-packspec',
  \  'Shougo/dpp-ext-toml',
  \  'Shougo/dpp-protocol-git',
  \  'vim-denops/denops.vim',
  \]

  for s:plugin in s:plugins
    call SetupPlugin(s:plugin)
  endfor

  if dpp#min#load_state(s:dpp_base)
    execute $'set runtimepath^={s:denops_src}'
    autocmd User DenopsReady
    \ call dpp#make_state(s:dpp_base, $'{g:myrc_home}/dpp/dpp.ts')
  else
    autocmd MyAutoCmd BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
    \ call dpp#check_files()
  endif

  autocmd MyAutoCmd User Dpp:makeStatePost
        \ : echohl WarningMsg
        \ | echomsg 'dpp make_state() is done'
        \ | echohl NONE
endfunction

call InitializeDpp()
