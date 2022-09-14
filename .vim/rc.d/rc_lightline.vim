" lightline
let g:lightline = {
      \ 'active' : {
      \   'left': [
      \      [ 'mode', 'paste' ],
      \      [ 'gitbranch', 'readonly', 'relativepath', 'modified' ],
      \    ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline.enable = {
		    \ 'statusline': 1,
		    \ 'tabline': 1
		    \ }

let g:lightline = {'colorscheme' : 'tokyonight'}
