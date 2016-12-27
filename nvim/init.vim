"------------------------------------------------------------------------------
"
" Miroslav Vidović
"
" neovim configuration
"
"------------------------------------------------------------------------------

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'mileszs/ack.vim'                    " Ack search
Plug 'jiangmiao/auto-pairs'               " Auto pairs
Plug 'vim-airline/vim-airline'            " Airline
Plug 'MattesGroeger/vim-bookmarks'        " Bookmarks
Plug 'bkad/CamelCaseMotion'               " Camel case motion
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy finder
Plug 'easymotion/vim-easymotion'          " Easy motion

" Commentary
Plug 'tpope/vim-commentary'
" Tagbar
Plug 'majutsushi/tagbar'
" Gitgutter
Plug 'airblade/vim-gitgutter'
" Syntax for various languages
Plug 'sheerun/vim-polyglot'
" One dark scheme
Plug 'joshdick/onedark.vim'
" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" NerdTree (load the plugin only on command not on startup)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Surround
Plug 'tpope/vim-surround'
" VimTmux Navigator
Plug 'christoomey/vim-tmux-navigator'
" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
" Snippets ultisnip
Plug 'SirVer/ultisnips'
" Snippets vim-snippets
Plug 'honza/vim-snippets'
" Neomake
Plug 'neomake/neomake'
" Add plugins to &runtimepath
call plug#end()

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
" Visual autocomplete for command menu
set wildmenu
" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw
" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3
" Highlight in gray only those characters that are beyond the 80 character margin
autocmd BufWinEnter * highlight ColorColumn ctermbg=237
call matchadd('ColorColumn', '\%81v', 100)
"
" }}}

" Set the colorscheme
colorscheme onedark

" Key Mappings {{{
"
" TODO: consider <space> as leader
" Better mapping tor the leader key
let mapleader = "č"
"
" Save with control + s
" (requires stty -ixon in .bashrc)
" normal mode: save
nnoremap <c-s> :w<CR>
" insert mode: escape to normal and save
inoremap <c-s> <Esc>:w<CR>l
" visual mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR>
"
" Clear the search highlighting with leader l
nnoremap <silent><leader>l : nohlsearch<CR>
"
" Execute commands from vim and get the result back as text
" example: write figlet Test in vim and then in normal mode press Q on that
" line
noremap Q !!sh<cr>
"
" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %
"
" File System Explorer (in vertical split)
map <leader>. :Vexplore<cr>
"
" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows
"
" Tmux style choose window by number
map <Leader>wc :ChooseWin<cr>
"
" Mapping space button to open \ close folds
nnoremap <space> za
vnoremap <space> zf
"
" Mapping for easy command history cycle
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"
" Better mapping for listing vim buffer
" list open buffers
map <leader>yt :ls<cr>
"
" Buffers delete (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>
"
" First last buffer in the list
nnoremap <silent> [b :bfirst<CR>
nnoremap <silent> ]b :blast<CR>
"
" Previous\Next buffer
map <left> :bprevious<CR>
map <right> :bnext<CR>
"
" }}}

" Plugins 
" => Ack vim {{{
" Vim plugin for Ack script
" ( https://github.com/mileszs/ack.vim)"
"
" Don't open the first result automatically. Just show the results.
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"}}}
" Airline {{{
" Use powerline fonts
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
" Enable disable tagbar integration
" let g:airline#extensions#tagbar#enabled = 1
" }}}

" Autopairs {{{
" Enable disable auto pairs with leader + p
let g:AutoPairsShortcutToggle = '<leader>p'
" }}}

" Camel case motion {{{
"
" Remap motion for dealing with with programming code
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" }}}
"
" CtrlP {{{
"
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
" }}}
"
" Deoplete {{{
" Enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 6
" Only manual auto complete no auto popup for now
" let g:deoplete#disable_auto_complete = 1
" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()
" }}}
"
" Easy Motion {{{
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
" }}}

" Indent Guides {{{
" Custom colors
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236
"
" Indent guides on startup
let g:indent_guides_enable_on_vim_startup = 1
"
" Start guides from level1
let g:indent_guides_start_level = 1
"
" Size of the line
let g:indent_guides_guide_size = 1
" TODO: Fix problm with java indent size
" }}}

" Gitgutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn
" }}}

" NerdTree {{{
" Open/close NERDTree with leader + t
map <leader>n :NERDTreeToggle<cr>
" To have NERDTree always open on startup (set = 1)
let g:nerdtree_tabs_open_on_console_startup = 0
" }}}
"
" Bookmarks {{{
" Highlight only the sign not the whole line
let g:bookmark_highlight_lines = 0
" }}}
"
" Tagbar {{{
nmap <leader>t :TagbarToggle<CR>
" }}}
"
" Ultisnips {{{
" Expand a snippet
let g:UltiSnipsExpandTrigger="<c-j>"
" 
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
"
" Commands {{{
"
" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM
" }}}
