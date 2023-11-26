" ---------------------------------------------------------
" | Keybindings

" nomal/visual mode
map <silent> <F3> :<C-u>setlocal relativenumber!<cr>
nmap <silent><ESC><ESC> :noh<cr>
nnoremap - :e %:h<cr>
nnoremap ,tn :tabnew<cr>
nnoremap <Leader>Q :bd!<cr>
nnoremap <Leader>q :bd<cr>
nnoremap <Leader>w :w<cr>
nnoremap <S-i> i <ESC><Right>
nnoremap <silent><C-h> :tabprevious<cr>
nnoremap <silent><C-l> :tabnext<cr>
nnoremap <silent><C-k> d$
nnoremap <silent>J n
nnoremap <silent>K N
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap Q <Nop>
nnoremap QQ :q<cr>
noremap <C-e> <END>
noremap <silent><C-a> :call <SID>home()<cr>
nmap <C-?> gcc
xmap <C-?> gcc

noremap H <C-w>h
noremap J <C-w>j
noremap K <C-w>k
noremap L <C-w>l

" insert mode
inoremap jj <ESC>
inoremap <C-c> <ESC>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-j> <RETURN>
"inoremap <silent><expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"    \ "\<TAB>" : ddc#manual_complete()

" visual mode

" console mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" terminal
tnoremap <Esc> <C-\><C-n>
tmap <C-p> <Up>
tmap <C-n> <Down>
"tnoremap <UP> <C-\><C-n><C-w>ki
"tnoremap <DOWN> <C-\><C-n><C-w>ji
"tnoremap <LEFT> <C-\><C-n><C-w>hi
"tnoremap <RIGHT> <C-\><C-n><C-w>li

function! s:home()
    let start_column = col('.')
    normal! ^
    if col('.') == start_column
        normal! 0
    endif
    return ''
endfunction

" for tab
nnoremap [TABCMD] <nop>
nmap t [TABCMD]

nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit
nnoremap <silent> [TABCMD]c :<c-u>tabnew<cr>
nnoremap <silent> [TABCMD]C :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
