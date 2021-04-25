set ts=4
set number

" https://qiita.com/MATO/items/47737abd776dcc1ce79a
" 文字コード
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" viとの互換性をとらない
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start
"----バックアップ関係----
" バックアップをとらない
set nobackup
" ファイルの上書き前にはバックアップを作る
set writebackup
" スワップファイルを1箇所に集めて消しやすくしておく
"set directory=/home/SWAP
"----検索関係----
" コマンド、検索パターンを100個まで履歴に残す
set history=1000
" 検索の時に大文字小文字を区別しない
set ignorecase
" 最後まで検索したら先頭に戻らない
set nowrapscan
" インクリメンタルサーチを使う
set incsearch
set ignorecase
set hlsearch
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r<%l/%L:%p%%>

set list
set listchars=tab:.-,trail:-,eol:$,extends:.,precedes:.,nbsp:%
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
	syntax on

	" PODバグ対策
	syn sync fromstart

	function! ActivateInvisibleIndicator()
		" 下の行の"　"は全角スペース
		syntax match InvisibleJISX0208Space "　" display containedin=ALL
		highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
		"syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
		"highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
		"syntax match InvisibleTab "\t" display containedin=ALL
		"highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
	endfunction

	augroup invisible
		autocmd! invisible
		autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
		augroup END
endif


" http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$
set display=lastline
set nowrap
set pumheight=10
set showmatch
set matchtime=1
set filetype=on


augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

"syntax on

" color setting
set background=dark
" colorscheme hybrid

" global setting
map <C-g> :Gtags
map <C-h> :Gtags -f %
map <C-J> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <C-a> :TlistToggle<CR>
map <C-e> :Explore<CR>
map <C-q> :qa<CR>

" ctags setting
"nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
"nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"-----------------------------------------------------------------------------
" Black background
"highlight StatusLine ctermfg=black ctermbg=gray
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
highlight CursorLine ctermfg=none  ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none  ctermbg=darkgray
"highlight Comment    ctermfg=DarkGreen  ctermbg=NONE
"highlight Directory  ctermfg=DarkGreen  ctermbg=NONE

" White background
"highlight Normal     ctermfg=black ctermbg=gray
"highlight StatusLine ctermfg=gray  ctermbg=black
"highlight CursorLine ctermfg=darkgray  ctermbg=none cterm=none
"highlight MatchParen ctermfg=none  ctermbg=darkgray

" vimdiff
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7
" vimdiff disable padding
" set diffopt-=filler
