" 一旦FiletypeをOFFにする
filetype off
filetype plugin indent off

" 画面表示の設定

set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set nocursorcolumn " カーソル列の背景色を変えない
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" コマンドラインの設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" マウスの設定

set mouse=a " 全モードでマウスを使えるように

" ビープの設定

" ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" スペルチェック(日本語は除外)
"""set spell
"""set spelllang=en,cjk
"""fun! s:SpellConf()
"""  redir! => syntax
"""  silent syntax
"""  redir END
"""
"""  set spell
"""
"""  if syntax =~? '/<comment\>'
"""    syntax spell default
"""    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
"""  else
"""    syntax spell toplevel
"""    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
"""  endif
"""
"""  syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
"""endfunc
"""
"""augroup spell_check
"""  autocmd!
"""  autocmd BufReadPost,BufNewFile,Syntax * call s:SpellConf()
"""augroup END

" leaderをスペースに割り当てておく
let mapleader = "\<Space>"



""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim', { 'do': 'nvim --headless +UpdateRemotePlugins +qall' }
Plug 'Shougo/deoplete.nvim', { 'do': 'nvim --headless +UpdateRemotePlugins +qall' }

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' "いろんなタブでNERDTreeを同時に開いたり閉じたり？
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'


Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'terryma/vim-expand-region' "選択範囲の拡大縮小を便利に

Plug 'chrisbra/SudoEdit.vim'

Plug 'Yggdroot/indentLine'

Plug 'cohama/lexima.vim' "auto close 周りの自動設定

" javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' } "es6 color

" Golang
Plug 'fatih/vim-go'

call plug#end()


" deoplete
let g:deoplete#enable_at_startup = 1

""" colorsheme
let g:onedark_termcolors=256
syntax on
colorscheme onedark

""" statusline関連
let g:airline_theme='onedark'
let g:airline_left_sep=''
let g:airline_right_sep=''

" jistr/vim-nerdtree-tabs
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
endif
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" tab関連
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

nnoremap    [Tag]   <Nop>
nmap    t [Tag]

map <silent> [Tag]c :tablast <bar> tabnew<CR> " tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>             " tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>              " tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>          " tp 前のタブ


" javascript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" ファイルタイプ関連を有効化する
filetype plugin indent on
