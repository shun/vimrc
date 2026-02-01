nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#do_action('itemAction')<CR>
nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
nnoremap <buffer><silent> i <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
nnoremap <buffer><silent> q <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer><silent> d
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>
