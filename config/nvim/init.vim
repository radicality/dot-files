function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/vim-tomorrow-theme'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'eagletmt/neco-ghc'

call plug#end()

"     SETS      "

set ruler     " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch " do incremental searching
set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set number      " line numbers
set autoindent  " autoindent
set ignorecase  " for smartcase to work better
set smartcase   " smart casing when searching
set tabstop=2   " Set tabsize
set softtabstop=2
set shiftwidth=2
set expandtab

set clipboard=unnamed

set wrap
set linebreak
set nolist
set ttyfast

set encoding=utf-8  " Proper encoding
set showmode
set cursorline
set laststatus=2
set scrolloff=10          " How much to scroll to the bottom
set history=100           " lines of command line history
set undolevels=100        " undo levels
set title                 " set the terminals title
set visualbell            " visual bells
set noerrorbells          " no bells
set wildmenu              " improved command line completion
set backup                " keep a backup file
set backupdir=~/.nvim_backups    " backup files location
set directory=~/.nvim_swaps      " swap files location

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

let mapleader = ","
let maplocalleader = ","

" For quick saving
vnoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w <Esc>:w<CR>

nnoremap <leader>d <Esc>:Dash<CR>

nmap <F8> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F8> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nnoremap j gj
nnoremap k gk

nnoremap <leader>n :NERDTreeToggle<CR>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" " Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" " Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Common misspellings
ab fro for
ab teh the

set guioptions-=r
set guioptions-=L

" Turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set gfn=Monaco:h13
  set guicursor+=a:blinkon0         " no cursor blinking
  colorscheme Tomorrow-Night-Eighties
endif

if has("autocmd")
  filetype on
  filetype plugin on
  filetype indent on

  autocmd FileType text setlocal textwidth=78
  autocmd FileType text set spell
else
  set autoindent  "if no autoindent
endif


let g:airline_powerline_fonts = 1
