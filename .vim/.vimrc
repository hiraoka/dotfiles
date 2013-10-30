set noswapfile
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set backspace=indent,eol,start "改行をdeleteで削除できる"
set hlsearch "検索文字列をハイライト"
set incsearch "インクリメントサーチをonにする"
set showmatch "対の括弧を入力"
set ww=<,>,[,] "➡ ⬅ で行をまたげる"
set autoread "同じファイルを開いている場合に変更を反映する(シンクロ！)"

autocmd BufWritePre * :%s/\s\+$//ge
syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角4文字分のスペース

"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
  syntax match SOLSpace "\s\+$" display containedin=ALL
  highlight SOLSpace term=underline ctermbg=LightGray
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
  syntax match JISX0208Space "　" display containedin=ALL
  highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
  syntax on
  augroup invisible
  autocmd! invisible
  autocmd BufNew,BufRead * call SOLSpaceHilight()
  autocmd BufNew,BufRead * call JISX0208SpaceHilight()
  augroup END
endif
