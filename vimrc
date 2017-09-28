" Cancek VI compatibility
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'qpkorr/vim-bufkill'
Plug 'itchyny/lightline.vim'
Plug 'croaker/mustang-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'lunaru/vim-less'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
"  Make sure you use single quotes
call plug#end()


""""""""""""""""""
" Display
""""""""""""""""""
set title             " Update window title
set number            " line number
"set relativenumber    " Relative line number
"augroup numbertoggle
  "autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
set ruler             " Display cursor position
set wrap              " Wrap long line
set scrolloff=3       " Space aroun cursor on top / bottom

set t_Co=256          " 256 colors
set encoding=utf-8
set hi=1000           " Command history
set guioptions-=m     " remove menu bar
set guioptions-=T     " remove toolbar
set guioptions-=r     " remove right-hand scroll bar
set guioptions-=L     " remove left-hand scroll bar
set autoread          " Reload file on external change

autocmd BufNewFile,BufRead *.log set synmaxcol=200  "Stop color highlight on lines of 200+ characters (slow)

hi NonText ctermfg=7 guifg=gray " Non text chars color

syntax enable  " Syntax hightlight

" Specific behaviour for file (syntax, indent ...)
filetype on
filetype plugin on
filetype indent on

" -- Search
set ignorecase        " Ignore case on serach
set smartcase         " Search with case if case in search
set incsearch         " Higligth search during search
set hlsearch          " Higligth search

" -- Beep
set visualbell        " No beep
set noerrorbells      " No beep

"convert tab to space
set expandtab
set tabstop=4
set shiftwidth=4

" Backspace normal behaviour
set backspace=indent,eol,start

" Allow buffer switch witouht be prompted 'save file'
set hidden

colorscheme mustang

if has("win32") || has("win16")
    set guifont=Consolas:h10
else
    if system('uname')=~'Darwin'
        "OSX
        set guifont=Menlo:h13
    else
        "Linux
        set guifont=Monospace
    endif
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|cache)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers = ['jslint']

" Files format
au BufNewFile,BufRead *.tpl :set ft=html " tpl are HTML
"TWIG coloration (use htmljinja a python template engine)
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.njk set filetype=htmljinja
au BufRead,BufNewFile *.scala set filetype=scala

"""""""""""""""""
" Key binding
"""""""""""""""""
" Leader map for plugins
let mapleader="\<Space>"

map <leader>lb :CtrlPBuffer <CR>

" Split naviguation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indent re-selection
vnoremap < <gv
vnoremap > >gv

nnoremap <CR> :nohlsearch<cr>

" map 2 line break + cursor in middle;
imap <C-c> <CR><Esc>O

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Copy past to system clipboard
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>y "+y
nmap <Leader>p "+p

" switch between tab
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>
vnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Where do you think you are !
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop> imap <right> <nop>


"HTML
" Bind ctrl + space for completion
:imap <C-Space> <C-X><C-O>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Open nerdtree on F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '\.swp$']

"map <F1> :let g:netrw_chgwin = winnr() <CR>
"map <F2> :Lexplore<CR>
"let g:netrw_liststyle = 3       " List style
"let g:netrw_banner = 0          " Remove useless header
"let g:netrw_browse_split = 4    " Open file in last window
"let g:netrw_winsize = 25        " Width
"let g:netrw_altv = 1
"let g:netrw_localrmdir='rm -r' " Allow to remove non empty folder

" Indent line carachter displayd
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 238

"php-doc : leader + h
nnoremap <leader>h :call PhpDocSingle()<CR> 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-I> :CtrlPBuffer<CR>


"emmet          : ctrl + y ,
"WindowSwap.vim : leader + ww
