set nocompatible
syntax on

filetype off
call pathogen#infect()
filetype plugin indent on

set history=10000
set number
set showmatch
set incsearch
set hlsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set tildeop
set nobackup
set nowritebackup
set noswapfile
set lazyredraw

set ignorecase smartcase

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>p :CtrlP<CR>
map <silent> <LocalLeader>fp :CtrlPClearCache<CR>
map Q <Nop>

" very magic (which somehow means normal regexes)
nnoremap / /\v

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

if &t_Co == 256
  colorscheme distinguished
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Trip trailing whitespace
function! Trim()
  exe "normal mz"
  %s/\s*$//
  exe "normal `z"
  exe "normal zz"
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>tw :Trim<CR>
