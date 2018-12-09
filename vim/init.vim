call plug#begin('~/.vim/plugged')
"common
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'pangloss/vim-javascript'

"Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'rakr/vim-one'

call plug#end()

" Settings
set autoread
syntax enable

:imap jj <Esc>

"  tmux set-option -ga terminal-overrides ",xterm-256color:Tc"
colorscheme onedark
set background=dark

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number

" set a map leader for more key combos
let g:mapleader = ','

if (has("termguicolors"))
  set termguicolors
endif

" Searching
set hlsearch
set incsearch " set incremental search, like modern browsers

"Open NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
