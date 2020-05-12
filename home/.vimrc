" Don't Copy indent from current line
set noautoindent

" Show the cursor position
set ruler

" Show the filename in the window titlebar
set title

" Make tabs as wide as two spaces
set tabstop=2

" Start scrolling one line before the horizontal window border
set scrolloff=1

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Use the appropriate number of spaces to insert a <TAB>
set expandtab

" Ignore case in search patterns unless pattern contains upper case chars
set ignorecase
set smartcase

" Long lines with wrap on display
set wrap

" Use visual bell instead of beeping
set visualbell

" Added from other users scripts
" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" JFV Start

" Enable syntax highlighting, JFV turned off colors for now
" off; stop highlighting completely
" manual; highlighting only for specific files
" on; enable but not switch it on automatically
syntax off

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Not sure about these lines, need to review
" " Respect modeline in files
" set modeline
" set modelines=4
" " Enable per-directory .vimrc files and disable unsafe commands in them
" set exrc
" set secure
" " Enable line numbers
" set number
" " Highlight current line
" set cursorline
" " Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
" " Highlight searches
" set hlsearch
" " Highlight dynamically as pattern is typed
" set incsearch
" " Always show status line
" set laststatus=2
" " Enable mouse in all modes
" set mouse=a
" " Disable error bells
" set noerrorbells
" " Don’t reset cursor to start of line when moving around.
" set nostartofline
" " Don’t show the intro message when starting Vim
" set shortmess=atI
" " Show the current mode
" set showmode
" " Show the (partial) command as it’s being typed
" set showcmd
" " Use relative line numbers
" if exists("&relativenumber")
" 	set relativenumber
" 	au BufReadPost * set relativenumber
" endif
" " Strip trailing whitespace (,ss)
" function! StripWhitespace()
" 	let save_cursor = getpos(".")
" 	let old_query = getreg('/')
" 	:%s/\s\+$//e
" 	call setpos('.', save_cursor)
" 	call setreg('/', old_query)
" endfunction
" noremap <leader>ss :call StripWhitespace()<CR>
" " Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>

" " Automatic commands
" if has("autocmd")
" 	" Enable file type detection
" 	filetype on
" 	" Treat .json files as .js
" 	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" 	" Treat .md files as Markdown
" 	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
" endif

" playing with colors
"set t_mr=^[[0;1;33;44m      " reverse (invert) mode
":set t_me=^[[0;1;36m     " normal mode (undoes t_mr and t_md)
":set t_me=<Ctrl-V><Esc>[0;1;36m     " normal mode (undoes t_mr and t_md)
":set t_mr=^[[0;1;33;44m  " reverse (invert) mode
":set t_md=<Ctrl-V><Esc>[1;33;41m    " bold mode
":set t_se=<Ctrl-V><Esc>[1;36;40m    " standout end
":set t_so=<Ctrl-V><Esc>[1;32;45m    " standout mode
":set t_ue=<Ctrl-V><Esc>[0;1;36m     " underline end
":set t_us=<Ctrl-V><Esc>[1;32m       " underline mode start


" Unsure if this works, copied from Unix vimrc
" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
autocmd BufReadPre,FileReadPre      *.gz set bin
autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost    *.gz set nobin

autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

autocmd FileAppendPre               *.gz !gunzip <afile>
autocmd FileAppendPre               *.gz !mv <afile>:r <afile>
autocmd FileAppendPost              *.gz !mv <afile> <afile>:r
autocmd FileAppendPost              *.gz !gzip <afile>:r

" imap  
