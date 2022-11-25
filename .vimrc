if &compatible
  set nocompatible
endif

let s:config_home = expand("$XDG_CONFIG_HOME")
let s:cache_home = expand("$XDG_CACHE_HOME")

let g:config_dir = expand("~/.vim")
let g:cache_dir = ""

if has('nvim')
    if s:cache_home == "$XDG_CACHE_HOME"
      let g:cache_dir = expand('~/.cache/nvim')
    else
      let g:cache_dir = expand("$XDG_CACHE_HOME") . '/nvim'
    endif
else
    if s:cache_home == "$XDG_CACHE_HOME"
      let g:cache_dir = expand('~/.cache/vim')
    else
      let g:cache_dir = expand("$XDG_CACHE_HOME") . '/vim'
    endif
endif

let g:rc_dir = g:config_dir . '/rc.d'

let mapleader = "\<Space>"
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>

" ---------------------------------------------------------
" | setting

set backspace=indent,eol,start
set cindent
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamed,unnamedplus
endif
set completeopt=noinsert,menuone
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,mac,dos
set hidden
set hlsearch
set ignorecase
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

au BufRead,BufNewFile *.styl set filetype=css
au BufRead,BufNewFile *.nvim set filetype=vim
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.vue set filetype=vue
au WinEnter,FocusGained * checktime

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


filetype plugin indent on
autocmd FileType xml,html inoremap <buffer> </ </<C-x><C-o>

augroup vimlsp_autoformat
  au!
  autocmd BufWritePre *.ts,*.tsx,*.rs LspDocumentFormatSync
augroup END

" ---------------------------------------------------------
" | Keybindings

" nomal/visual mode
map <silent> <F3> :<C-u>setlocal relativenumber!<cr>
nmap <ESC><ESC> :noh<cr>
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

function! s:option_to_edit() abort
  setlocal buftype= modifiable noreadonly
  setlocal list tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab textwidth=78
  setlocal colorcolumn=+1
  setlocal conceallevel=0
endfunction

command! HelpEdit call <SID>option_to_edit()

execute 'source' g:config_dir . '/rc.d/rc_dein.vim'
syntax on

highlight Comment guifg=#538fcc
