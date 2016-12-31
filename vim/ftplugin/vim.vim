" File ~/.vim/ftplugin/vim.vim
" ($HOME/vimfiles/ftplugin/vim.vim on Windows)
" Vim files specific settings.
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" Marker folding for vim files
setlocal foldmethod=marker
" Fold everything on file open
execute "normal zM"
