"------------------------------------------------------------------------------
"
" Miroslav Vidović
"
" vimrc file
"
"------------------------------------------------------------------------------
"
" Settings {{{
"
" Switch syntax highlighting on, when the terminal has colors
syntax on
" Auto-indent code when available
filetype indent on
" Use vim, not vi api
set nocompatible
" No backup files
set nobackup
" No write backup
set nowritebackup
" No swap file
set noswapfile
" Command history
set history=500
" Always show cursor
set ruler
" Show incomplete commands
set showcmd
" Incremental searching (search as you type)
set incsearch
" Highlight search matches
set hlsearch
" Ignore case in search
set smartcase
" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase
" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden
" Turn word wrap off
set nowrap
" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start
" Convert tabs to spaces
set expandtab
" Set tab size in spaces (this is for manual indenting)
set tabstop=4
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4
" Turn on line numbers
set number
" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·
" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100
" Always show status bar
set laststatus=2
" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
" Hide the toolbar
set guioptions-=T
" UTF encoding
set encoding=utf-8
" Autoload files that have changed outside of vim
set autoread
" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed
" Don't show intro
set shortmess+=I
" Better splits (new windows appear below and to the right)
set splitbelow
set splitright
" Enable the mouse
" set mouse=a
" Visual autocomplete for command menu
set wildmenu
" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw
" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch
" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3
" Highlight in gray only those characters that are beyond the 80 character margin
autocmd BufWinEnter * highlight ColorColumn ctermbg=lightgray
call matchadd('ColorColumn', '\%81v', 100)
" }}}
"
" Plugins {{{
"------------------------------------------------------------------------------
" * Pathogen
"-------------------------
" Vim plugin manager
"------------------------------------------------------------------------------
execute pathogen#infect()
filetype plugin indent on
syntax on
"
"------------------------------------------------------------------------------
" Theme Settings
"------------------------------------------------------------------------------
"set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
colorscheme gruvbox
"set t_ut=
"
" Line number section background color
" highlight LineNr ctermbg=black
" Line number section foreground color
" highlight LineNr ctermfg=gray

"------------------------------------------------------------------------------
" * Auto-pairs
"-------------------------
" Vim plugin, insert or delete brackets, parens, quotes in pair
" (https://github.com/jiangmiao/auto-pairs)
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Neocomplete
"------------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"------------------------------------------------------------------------------
" * CtrlP
"-------------------------
" Full path fuzzy file, buffer, mru, tag finder for Vim
" (https://github.com/ctrlpvim/ctrlp.vim)
"------------------------------------------------------------------------------
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1
" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
" CtrlP -> use Ag for searching instead of VimScript
" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'
" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'
"
"------------------------------------------------------------------------------
" * Airline
"-------------------------
" Status/tab line for vim
" (https://github.com/vim-airline/vim-airline)
" * Airline themes
" (https://github.com/vim-airline/vim-airline-themes)
"------------------------------------------------------------------------------
" Set airline theme - vim-airline-themes plugin
" if left unset auto theme is set according to vim theme
let g:airline_theme='jellybeans'
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
" Set powerline fonts
let g:airline_powerline_fonts = 1
"
"------------------------------------------------------------------------------
" * Tagbar
"-------------------------
" Vim plugin that displays tags in a window, ordered by scope
" (https://github.com/majutsushi/tagbar)
"------------------------------------------------------------------------------
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)
" Control the tagbar width
let g:tagbar_width = 30
"
"------------------------------------------------------------------------------
" * Gitgutter
"-------------------------
" A vim plugin which shows a git diff in gutter(sign column) and stages hunks
" (https://github.com/airblade/vim-gitgutter)
"------------------------------------------------------------------------------
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
"
"------------------------------------------------------------------------------
" * Tmuxline
"-------------------------
" Simple tmux statusline generator with powerline symbols and statusline
" or airline integration
" (https://github.com/edkolev/tmuxline.vim)
"------------------------------------------------------------------------------
" Separator
let g:tmuxline_powerline_separators = 1
" Tmuxline style
let g:tmuxline_preset = 'powerline'

"------------------------------------------------------------------------------
" * NERDTree
"-------------------------
" Tree file explorer for vim
" (https://github.com/scrooloose/nerdtree)
"------------------------------------------------------------------------------
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup (set = 1)
let g:nerdtree_tabs_open_on_console_startup = 0
" Searching the file system
map <leader>' :NERDTreeToggle<cr>

"------------------------------------------------------------------------------
" * Tabular
"-------------------------
" Vim script for text filtering and alignment
" (https://github.com/godlygeek/tabular)
"------------------------------------------------------------------------------
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>
"
"------------------------------------------------------------------------------
" * PIV
"-------------------------
" Vim PHP integration plugin
" (https://github.com/spf13/PIV)
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" * Scratch
"-------------------------
" Unobtrusive scratch window
" (https://github.com/mtth/scratch.vim)
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" * Bookmarks
"-------------------------
" Vim bookmarks plugin
" (https://github.com/MattesGroeger/vim-bookmarks)
"------------------------------------------------------------------------------
"highlight BookmarkSign ctermbg=NONE ctermfg=160
"highlight BookmarkLine ctermbg=187 ctermfg=18
"
" Highlight only the sign not the whole line
let g:bookmark_highlight_lines = 0
"
"------------------------------------------------------------------------------
" * ChooseWin
"-------------------------
" Land on window you chose like tmux's 'display-pane'
" (https://github.com/t9md/vim-choosewin)
"------------------------------------------------------------------------------
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
"
"------------------------------------------------------------------------------
" * Commentary
"-------------------------
" Comment stuff out
" (https://github.com/tpope/vim-commentary)
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" * Easymotion
"-------------------------
" Vim motions on speed
" (https://github.com/easymotion/vim-easymotion)
"------------------------------------------------------------------------------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
map <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"
"------------------------------------------------------------------------------
" * Indent Guides
"-------------------------
"  A Vim plugin for visually displaying indent levels in code
" (https://github.com/nathanaelkane/vim-indent-guides)
"------------------------------------------------------------------------------
" Custom colors
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236
" Indent guides on startup
"let g:indent_guides_enable_on_vim_startup = 1
" Start guides from level1
let g:indent_guides_start_level = 1
" Size of the line
let g:indent_guides_guide_size = 1
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" * Polyglot
"-------------------------
" A solid language pack for Vim
" (https://github.com/sheerun/vim-polyglot)
"------------------------------------------------------------------------------
"let g:polyglot_disabled = ['css']
"
"------------------------------------------------------------------------------
" * Surround
"-------------------------
" Quoting/parenthesizing made simple
" (https://github.com/tpope/vim-surround)
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" * VimWiki
"-------------------------
" - personal wiki for vim
" (https://github.com/vimwiki/vimwiki)
"
"------------------------------------------------------------------------------
" * Syntastic
" ------------------------
"  - syntax checking plugin
"------------------------------------------------------------------------------
" Different signs for different error types.
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "▲"
" Different colors for different error types.
highlight SyntasticStyleError ctermbg=none
highlight SyntasticStyleErrorSign ctermbg=none ctermfg=yellow
" Statusline information
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Do not highlight errors
let g:syntastic_enable_highlighting = 0
" Populate the list of errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Check on open disabled
let g:syntastic_check_on_open = 0
" Check on save disabled
let g:syntastic_check_on_wq = 0
" Only passive mode chekcing - only manual syntax checks
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
" Toggle Syntastic Error list (show \ hide it)
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
"
"------------------------------------------------------------------------------
" * Ultisnips
"-------------------------
" The ultimate snippet solution for Vim
" (https://github.com/SirVer/ultisnips)
"------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"------------------------------------------------------------------------------
" * CamelCaseMotion
"-------------------------
" Provide CamelCase motion through words
" (https://github.com/bkad/CamelCaseMotion)
"------------------------------------------------------------------------------
" Camel Case Motion (for dealing with programming code)
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
"
" }}}
"
" Mappings {{{
"
" Clear the search highlighting with leader l
nnoremap <silent><leader>l : nohlsearch<CR>
" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %
" File System Explorer (in vertical split)
map <leader>. :Vexplore<cr>
" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows
"" Tmux style choose window by number
map <Leader>wc :ChooseWin<cr>
"" Tagbar open/close window
nmap <F8> :TagbarToggle<cr>
"" Mapping space button to open \ close folds
nnoremap <space> za
vnoremap <space> zf
" Mapping for manual Syntastic syntax check
nmap <leader>sc :SyntasticCheck<CR>
" Show\Syntastic error list with ctr+e
nnoremap <C-e> :<C-u>call ToggleErrors()<CR>
" Mapping for easy command history cycle
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Better mapping for listing vim buffer
" list open buffers
map <leader>yt :ls<cr>
" buffers delete (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>
" first last buffer in the list
nnoremap <silent> [b :bfirst<CR>
nnoremap <silent> ]b :blast<CR>
" previous next buffer
map <F9> :bprevious<CR>
map <F10> :bnext<CR>
" }}}

" Commands {{{
"
""" Have Vim jump to the last position when
" reopening a file
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif
fun! StripTrailingWhitespace()
"
" don't strip on these filetypes
if &ft =~ 'markdown'
return
endif
%s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab
" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM
" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
highlight SpellBad cterm=bold ctermfg=white ctermbg=red
highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()
""" Change the colorscheme when diffing
fun! SetDiffColors()
highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen
highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" Set buffer to be modifiable (needed to create files in NerdTree)
autocmd BufWinEnter * setlocal modifiable
"
" }}}