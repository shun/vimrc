nnoremap <Space>/ <Cmd>Ddu -name=search line -ui-param-ff-startFilter<CR>
nnoremap <Space>* <Cmd>Ddu -name=search line -input=`expand('<cword>')` -ui-param-ff-startFilter=v:false<CR>
nnoremap <Space>n <Cmd>Ddu -name=search -resume -ui-param-ff-startFilter=v:false<CR>

nnoremap <Space>g <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ', expand('<cword>'))`<CR>

nnoremap ;g <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ')`<CR>
nnoremap ;* <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ', expand('<cword>'))`<CR>
nnoremap ;n <Cmd>Ddu -name=grep -resume -ui-param-ff-startFilter=v:false<CR>

nnoremap <Space>f <Cmd>Ddu file_external<CR>
nnoremap <Space>b <Cmd>Ddu buffer<CR>
