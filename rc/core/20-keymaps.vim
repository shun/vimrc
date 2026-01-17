"---------------------------------------------------------------------------
" キーマップ
"---------------------------------------------------------------------------

" ノーマル/ビジュアル/オペレータ共通: 検索ハイライトを解除
noremap <silent><ESC><ESC> :noh<cr>

" ノーマルモード: 表示・移動・タブ操作
nnoremap <silent> <F3> :<C-u>setlocal relativenumber!<cr>
" 新しいタブを開く
nnoremap ,tn :tabnew<cr>
" バッファを強制終了/通常終了
nnoremap <Leader>Q :bd!<cr>
nnoremap <Leader>q :bd<cr>
" 保存
nnoremap <Leader>w :w<cr>
" 空白を1つ挿入してカーソルを右へ
nnoremap <S-i> i <ESC><Right>
" タブ移動
nnoremap <silent><C-h> :tabprevious<cr>
nnoremap <silent><C-l> :tabnext<cr>
" 行末まで削除
nnoremap <silent><C-k> d$
" 表示行単位で移動
nnoremap <silent>j gj
nnoremap <silent>k gk
" Exモードを無効化
nnoremap Q <Nop>
" すぐに終了
nnoremap QQ :q<cr>
" 行末へ移動
nnoremap <C-e> <END>
" 行頭/非空白のトグル移動
nnoremap <silent><C-a> :call <SID>home()<cr>

" ウィンドウ移動
noremap H <C-w>h
noremap J <C-w>j
noremap K <C-w>k
noremap L <C-w>l

" 挿入モード
inoremap jj <ESC>
inoremap <C-c> <ESC>
inoremap <C-a> <C-o>:call <SID>home()<cr>
inoremap <C-e> <END>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-j> <RETURN>

" コマンドラインモード
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" ターミナルモード
" 端末から通常モードへ
" NOTE: tnoremap は端末バッファのみ

tnoremap <Esc> <C-\><C-n>
tmap <C-p> <Up>
tmap <C-n> <Down>
"tnoremap <UP> <C-\><C-n><C-w>ki
"tnoremap <DOWN> <C-\><C-n><C-w>ji
"tnoremap <LEFT> <C-\><C-n><C-w>hi
"tnoremap <RIGHT> <C-\><C-n><C-w>li

" 行頭移動をトグルするヘルパー
function! s:home() abort
  let l:start_column = col('.')
  normal! ^
  if col('.') == l:start_column
    normal! 0
  endif
  return ''
endfunction

" タブ操作用のプレフィックス
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
