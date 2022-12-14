" dein Scripts ------------------------------

let s:dein_dir = g:cache_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:dein#auto_recache = v:true
let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
"let g:dein#enable_notification = v:true
let g:dein#install_log_filename = '/tmp/dein.log'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let s:toml = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
	let s:ddc_toml = g:rc_dir . '/dein_ddc.toml'
	let s:ddu_toml = g:rc_dir . '/dein_ddu.toml'

	call dein#load_toml(s:toml,      {'lazy' : 0})
	call dein#load_toml(s:lazy_toml, {'lazy' : 1})
	call dein#load_toml(s:ddc_toml,  {'lazy' : 1})
	call dein#load_toml(s:ddu_toml,  {'lazy' : 1})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
