execute pathogen#infect()
filetype plugin indent on

" colorscheme
set background=dark
colorscheme solarized

syntax on        " Syntax highlighting

set ls=2         " allways show status line
set shiftwidth=4 " numbers of spaces to (auto)indent
set incsearch
set ignorecase   " ignore case when searching
set smartcase
set tabstop=4    " Tab length

set expandtab    " Substitute tabs with spaces
set nu           " Enable line numbering
set hlsearch     " Highlight matched search pattern
set autoindent   " always set autoindenting on
set ruler        " Show cursor position

" Shortcuts for tabs
:nmap <C-S-t> :tabnew<CR>
:nmap <M-Right> :tabnext<CR>
:nmap <M-Left> :tabprev<CR>

match ErrorMsg '\s\+$'
set mouse=a

set runtimepath^=~/.vim/bundle/ctrlp.vim

