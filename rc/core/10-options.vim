"---------------------------------------------------------------------------
" オプション
"---------------------------------------------------------------------------

" バックスペースキーの動作を設定
set backspace=indent,eol,start

" C言語スタイルのインデントを有効にする
set cindent

" クリップボードの設定
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamed,unnamedplus
endif

" 補完オプションの設定
"set completeopt=noinsert,menuone
set completeopt=menuone
if exists('+completepopup')
  set completeopt+=popup
  set completepopup=height:4,width:60,highlight:InfoPopup
endif

" カーソル行のハイライトを有効にする
set cursorline

" エンコーディングをUTF-8に設定
set encoding=utf-8

" タブをスペースに変換
set expandtab

" ファイルエンコーディングの設定
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

" ファイルフォーマットの設定
set fileformats=unix,mac,dos

" バッファを非表示にして保持する
set hidden

" 検索結果をハイライト
set hlsearch

" 大文字小文字を無視して検索
set ignorecase

" スマートケースを有効にする
set smartcase

" ステータスラインを常に表示
set laststatus=2

" 不可視文字を表示
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" マウスの設定 (必要なら有効化)
"set mouse=a

" バックアップファイルを作成しない
set nobackup

" 外部更新の自動読み込み
set autoread

" スワップファイルを作成しない
set noswapfile

" テキストの折り返しを無効にする
set nowrap

" 検索の折り返しを無効にする
set nowrapscan

" 行番号を表示
set nu

" ポップアップメニューの高さを設定
set pumheight=10

" 相対行番号を有効にする (必要なら有効化)
"set relativenumber

" ルーラーを表示
set ruler

" スクロールオフセットを設定
set scrolloff=8

" シフト幅を設定
set shiftwidth=4

" コマンドを表示
set showcmd

" 対応する括弧を表示
set showmatch

" サインカラムを表示
set signcolumn=yes

" ソフトタブストップを設定
set softtabstop=0

" カラースキームを256色に設定 (Vim向け)
if exists('&t_Co')
  set t_Co=256
endif

" タブ幅を設定
set tabstop=2

" タイムアウトを有効にする
set ttimeout

" タイムアウトの長さを設定
set ttimeoutlen=50

" ワイルドカードの大文字小文字を無視
set wildignorecase

" ワイルドモードの設定
set wildmode=longest,full

" インクリメンタル検索を無効にする (必要なら有効化)
"set noincsearch

" 自動コマンドの設定 (rc/ft/ での管理を推奨)
"if has("autocmd")
"  filetype plugin on
"  filetype indent on
"
"  " ファイルタイプごとの設定
"  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
"  autocmd Filetype java            setlocal sw=4 sts=4 ts=4 et omnifunc=javacomplete#Complete
"  autocmd FileType c               setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType cpp             setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType go              setlocal sw=4 sts=4 ts=4 noet
"  autocmd FileType php             setlocal sw=4 sts=4 ts=4 noet
"  autocmd FileType ruby            setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType python          setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType json            setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType html            setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType css             setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType javascript      setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType yaml            setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType js              setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType rust            setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType vue             setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType plantuml        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType stpl            setlocal sw=4 sts=4 ts=4 noet
"endif
