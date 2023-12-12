if &compatible
  set nocompatible
endif

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

try
  set cmdheight=0

  " For recording messages
  autocmd MyAutoCmd CmdlineEnter,RecordingEnter * set cmdheight=1
  autocmd MyAutoCmd CmdlineLeave,RecordingLeave * set cmdheight=0
catch
  set cmdheight=1
endtry

language message C

const g:myconfig_home = $'{$HOME}/.vim'
if !isdirectory(g:myconfig_home)
	call mkdir(g:myconfig_home, 'p')
endif

const g:myrc_home = $'{g:myconfig_home}/rc'
let $MYRC_HOME = $'{g:myrc_home}'

"-------------------------------------------------------------

" initialize dpp
execute 'source' $'{g:myrc_home}/dpp/dpp.vim'

const s:vimrcs = [
\	$'{$MYRC_HOME}/options.vim',
\	$'{$MYRC_HOME}/mappings.vim',
\	$'{$MYRC_HOME}/filetype.vim',
\]

command DppUpdate call dpp#async_ext_action('installer', 'checkNotUpdated')
command DppUpdateAll call dpp#async_ext_action('installer', 'update')
command DppInstall call dpp#async_ext_action('installer', 'install')

for s:vimrc in s:vimrcs
	execute 'source' s:vimrc
endfor

filetype indent plugin on

if has('syntax')
	syntax on
	execute 'source' $'{$MYRC_HOME}/colors.vim'
endif

