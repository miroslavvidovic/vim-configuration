"------------------------------------------------------------------------------
"
" Miroslav Vidović
"
" neovim configuration
"
"------------------------------------------------------------------------------

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'bkad/CamelCaseMotion'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }
Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'benmills/vimux'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-utils/vim-man', { 'on': 'Man' }
Plug 'terryma/vim-smooth-scroll'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'metakirby5/codi.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'MaxSt/FlatColor'
Plug 'w0ng/vim-hybrid'

" Add plugins to &runtimepath
call plug#end()

" => General settings {{{

set nocompatible    " Use vim, not vi api

set history=500     " Command history

set encoding=utf-8  " UTF encoding

set autoread        " Autoload files that have changed outside of vim

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

set shortmess+=I    " Don't show intro

" Get rid of the delay when pressing O (for example)
set timeout timeoutlen=1000 ttimeoutlen=100

set clipboard=unnamedplus  " Use system clipboard on Linux

" Enable filetype plugin
filetype plugin on 
filetype indent on

" No backup and no swap files
set nobackup        " No backup files
set nowritebackup   " No write backup
set noswapfile      " No swap file

" Correct colors for terminator terminal
set t_Co=256

" }}}
" => User interface settings  {{{

" Use gui style colors and fonts (supported only in newer versions)
set termguicolors

syntax on       " Switch syntax highlighting on

set number      " Turn on line numbers
" set cursorline  " Highlight the current line - (slow)

" Netrw settigns
let g:netrw_liststyle=3       "Tree view style
let g:netrw_banner = 0        "Remove the top banner
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 25      "Window size

" Automatically set indent of new line
set autoindent
set smartindent

" Toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Better search options
set incsearch     " Incremental searching (search as you type)
set hlsearch      " Highlight search matches
set smartcase     " Case sensitive if expression contains a capital letter
set ignorecase    " Case insensitive search

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Turn word wrap off TODO: consider using wortd wraping
set nowrap
set textwidth=0

" Tab options
set expandtab     " Convert tabs to spaces
set smarttab
set tabstop=4     " Set tab size in spaces (this is for manual indenting)
set softtabstop=4
set shiftwidth=4  " The number of spaces inserted for a tab (used for auto indenting)

" Other options
set ttyfast         " Faster redrawing
set laststatus=2    " Always show status bar
set wildmenu        " Visual autocomplete for command menu
set showcmd         " Show incomplete commands
set hidden          " Current buffer can be put into background
set lazyredraw      " Redraw only when we need to

set magic           " For regular expressions turn magic on

set ruler           " Always show the current positon

" Folding settings
set foldmethod=manual   " Use manual folding 
set nofoldenable        " Disable auto folding

" }}}
" => Theme  {{{
"
" Gruvbox colorscheme
colorscheme gruvbox

" Set the dark theme
set background=dark

" Line number section colors
" Background color
 highlight LineNr ctermbg=236
" Foreground color
highlight LineNr ctermfg=133

" }}}
" => Key Mappings  {{{

" Better mapping tor the leader key
let mapleader = "č"

" Disable annoying F1 help screen
" if you use vim in the terminal remember to
" disable F1 shortcut in your terminal app
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Save with control + s
" (requires stty -ixon in .bashrc)
" normal mode: save
nnoremap <c-s> :w<CR>
" insert mode: escape to normal and save
inoremap <c-s> <Esc>:w<CR>l
" visual mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR>
" Clear the search highlighting with leader l
nnoremap <silent><leader>cl : nohlsearch<CR>

" Execute commands from vim and get the result back as text
" example: write figlet Test in vim and then in normal mode press Q on that
" line
noremap Q !!sh<cr>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" Change directory to the curently edited file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Mapping space button to open \ close folds
nnoremap <space> za
vnoremap <space> zf

" Mapping for easy command history cycle
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Better mapping for listing vim buffer
" nmap <leader>bb :ls<CR>:buffer<Space>
map <leader>b :CtrlPBuffer<CR>

" Buffers delete (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>

" First last buffer in the list
nnoremap <silent> [b :bfirst<CR>
nnoremap <silent> ]b :blast<CR>

" Previous\Next buffer
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

map <up> :tabn<CR>
map <down> :tabp<CR>

" Toggle between relative and normal line numbers - function
nnoremap š :call NumberToggle()<cr>

" Use ranger file explorer in vim - function
map <Leader>rx :call RangerExplorer()<CR>

" Tags 
" Open the definition under cursor in a split tab
map <leader>vo :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 
" Open the definition under cursor (the same as C+] but easier to type)
map <leader>to :exec("tag ".expand("<cword>"))<CR> 

" Close the current window
map <leader>xw :close<CR>
map <leader>xb :bd<CR>

" Search zeal with filetype:word_under_cursor
nnoremap gz : call OpenInZeal()<CR>

" ROT13 the whole buffer
map <leader>13 ggVGg?
" }}}
" => Functions  {{{

"Toggle between relative and normal line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Change the colorscheme when diffing
fun! SetDiffColors()
highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen
highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed
endfun

" Set custom spell checking colors
fun! SetSpellingColors()
highlight SpellBad cterm=bold ctermfg=white ctermbg=red
highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun

" Use ranger file explorer from vim
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
" }}}
" => Autocommands  {{{

" Highlight in gray only those characters that are beyond the 80 character margin
autocmd BufWinEnter * highlight ColorColumn ctermbg=237
call matchadd('ColorColumn', '\%81v', 100)

" Call custom collorscheme when diffing
autocmd FilterWritePre * call SetDiffColors()

" Custom spelling check colors
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" File specific settings 
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 
autocmd FileType txt setlocal foldmethod=marker
autocmd FileType cucumber,ruby,yaml,zsh setlocal shiftwidth=2 tabstop=2 expandtab
" }}}

" Plugins 
" => Ack vim {{{
" Don't open the first result automatically. Just show the results.
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"}}}
" => Autopairs {{{
" Enable disable auto pairs with leader + p
let g:AutoPairsShortcutToggle = '<leader>p'
" }}}
" => Bookmarks {{{
" Highlight only the sign not the whole line
let g:bookmark_highlight_lines = 0
" }}}
" => CamelCaseMotion {{{
" Remap motion for dealing with with programming code
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" }}}
" => CtrlP {{{
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
" }}}
" => Easy Motion {{{
" Need one more keystroke, but on average, it may be more comfortable.
nmap ć <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}
" => Gitgutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0

set signcolumn=yes
highlight clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" }}}
" => Indent Guides {{{
" Indent guides on startup
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
" Custom colors
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236
" Start guides from level2
let g:indent_guides_start_level = 2
" Size of the line
let g:indent_guides_guide_size = 1
" }}}
" => NerdTree {{{
" Open/close NERDTree F2
nmap <F2> :NERDTreeToggle<cr>
" Open/close NERDTree with '
map <leader>n :NERDTreeToggle<cr>
" To have NERDTree always open on startup (set = 1)
let g:nerdtree_tabs_open_on_console_startup = 0
" }}}
" => Deoplete {{{
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
" => Smooth scroll {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}
" => Neomake {{{
" Run neomake on every file save
" autocmd! BufWritePost * Neomake
" }}}
" => Ultisnips {{{
" Custom key mappings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" => Vimux {{{
" WindowHeight
let g:VimuxHeight = "40"
" Prompt for the command
map <Leader>vp :VimuxPromptCommand<CR>
" Close the open pane
map <Leader>vc :VimuxCloseRunner<CR>
 " Zoom the tmux runner page
 map <Leader>vz :VimuxZoomRunner<CR>
" Run the lat command
map <Leader>vl :VimuxRunLastCommand<CR>
" }}} 
" => Undo tree {{{
if has("persistent_undo")
  set undodir=~/.config/nvim/undodir/
  set undofile
endif

" Toggle the undo tree with <F3>
nnoremap <F3> :UndotreeToggle<cr>
"}}}
" => Tabular {{{
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>
" }}}
" => Tagbar {{{
" Open/close tagbar with \b
nmap <silent> <leader>t :TagbarToggle<CR>
" Tagbar open/close window
nmap <F8> :TagbarToggle<cr>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)
" Control the tagbar width
let g:tagbar_width = 40
"}}}
