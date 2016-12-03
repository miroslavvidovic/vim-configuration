" Miroslav Vidović
"
" gvimrc
"
" -----------------------------------------------------------------------------
" Settings for GVim only
" -----------------------------------------------------------------------------
" On start GVim  will first load .vimrc settings and then .gvimrc (this file)
" Most of these settings override the .vimrc settings for better visual
" presentation outside of the terminal.
" -----------------------------------------------------------------------------
"
" Colorscheme
colorscheme gruvbox

" Font
set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 11

" Disable Gui features
" Hide the toolbar
set guioptions-=T
" Disable left scrollbar
set guioptions-=L
set guioptions-=l
" Disable right scrollbar
set guioptions-=R
set guioptions-=r

" Color for characters over the line length margin
" different color from the terminal version
autocmd BufWinEnter * highlight ColorColumn guibg=#3A3A3A
call matchadd('ColorColumn', '\%81v', 100)
