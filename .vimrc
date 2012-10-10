syntax on        " Syntax highlighting 
colorscheme desert 

set ls=2         " allways show status line
set shiftwidth=4 " numbers of spaces to (auto)indent
set ignorecase   " ignore case when searching 
set tabstop=4    " Tab length 
" set expandtab    " Substitute tabs with spaces 
set nu           " Enable line numbering 
set hlsearch     " Highlight matched search pattern
set autoindent   " always set autoindenting on
set ruler        " Show cursor position

" Shortcuts for tabs
:nmap <C-S-t> :tabnew<CR>
:nmap <M-Right> :tabnext<CR>
:nmap <M-Left> :tabprev<CR>


" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
