set backspace=indent,eol,start
set cindent
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamed,unnamedplus
endif
"set completeopt=noinsert,menuone
set completeopt=menuone
if exists('+completepopup')
  set completeopt+=popup
  set completepopup=height:4,width:60,highlight:InfoPopup
endif
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,mac,dos
set hidden
set hlsearch
set ignorecase
set laststatus=2
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"set mouse=a
set nobackup
"set noincsearch
set noswapfile
set nowrap
set nowrapscan
set nu
set pumheight=10
"set relativenumber
set ruler
set scrolloff=8
set shiftwidth=4
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set softtabstop=0
set t_Co=256
set tabstop=4
set ttimeout
set ttimeoutlen=50
set wildignorecase
set wildmode=longest,full


if has("autocmd")
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd Filetype java            setlocal sw=4 sts=4 ts=4 et omnifunc=javacomplete#Complete
  autocmd FileType c               setlocal sw=2 sts=2 ts=2 et
  autocmd FileType cpp             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go              setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType php             setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType ruby            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python          setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et omnifunc=htmlcomplete#CompleteTags
  autocmd FileType yaml            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js              setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType plantuml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stpl            setlocal sw=4 sts=4 ts=4 noet
endif
