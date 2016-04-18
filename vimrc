set ts=4
set number

" http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$
set display=lastline
set nowrap
set pumheight=10
set showmatch
set matchtime=1
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" color setting
set background=dark
" colorscheme hybrid

" global setting
map <C-g> :Gtags
map <C-h> :Gtags -f %
map <C-J> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"-----------------------------------------------------------------------------
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
