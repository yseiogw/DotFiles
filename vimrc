set ts=4
set number

" http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$
set display=lastline
set nowrap
set pumheight=10
set showmatch
set matchtime=1
set filetype=on
set incsearch
set ignorecase
set hlsearch

set laststatus=2
set statusline=%F%r%h%=

augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

syntax on

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
highlight StatusLine ctermfg=black ctermbg=gray
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
