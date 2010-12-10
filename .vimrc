
"""       RAFAL's .vimrc		"

set nocompatible


"     SETS      "

set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set incsearch					" do incremental searching
set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set number						" line numbers
set nowrap						" don't wrap lines
set autoindent					" autoindent
set smartcase					" smart casing when searching
set tabstop=4					" Set tabsize
set softtabstop=4
set shiftwidth=4
set expandtab
set ttyfast

set encoding=utf-8				" Proper encoding
set showmode
set cursorline
set laststatus=2


set history=100					" lines of command line history
set undolevels=100				" undo levels
set title						" set the terminals title
set visualbell					" visual bells
set noerrorbells				" no bells
set wildmenu					" improved command line completion

set backup						" keep a backup file
set backupdir=~/.vim_backups	" backup files location
set directory=~/.vim_swaps		" swap files location


"set showmatch					" This doesn't seem to work
								" brackets highlight regardles of this option
"set matchtime=5					" This doesn't seem to work

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set dictionary=/usr/share/dict/words
let g:pydoc_cmd = "/usr/bin/pydoc2.6"

" SuperTab settings
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"     


let Tlist_Ctags_Cmd='/opt/local/bin/ctags'



let mapleader = ","

" For quick saving
vnoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w <Esc>:w<CR>

nnoremap j gj
nnoremap k gk


" Common misspellings
ab fro for
ab teh the

""""""""""""""""""""""""""""
"           GUI STUFF
""""""""""""""""""""""""""""

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  	syntax on
  	set hlsearch
	"set background=dark

  	" if &t_Co >= 256
		 colorscheme darkspectrum 
	" endif
endif

if has("autocmd")

  filetype on					" detect the filetype
  filetype plugin on			" load filetype plugins
  filetype indent on			" load indent files for filetypes
	
  " autocmd FocusLost * :wa  " auto-save when vim loses focus

    let g:pydiction_location = '~/.vim/pydiction/complete-dict'

    let g:syntastic_enable_signs=1
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else
  set autoindent		" if we don't have autocmd, then indent everything

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" REMAPS
"
" Navigation
"
