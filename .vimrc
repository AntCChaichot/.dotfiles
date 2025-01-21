"Get the defaults that most users want. (Uncomment line below)
" source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

syntax enable
filetype plugin indent on
set autoindent " copy indent from current line when starting a new line 
set shiftwidth=0 " number of spaces used for each step of autoindent, if 0, tabstop value is used
set tabstop=4 " number of spaces the fule counts for
set softtabstop=-1 " number of spaces a <tab> counts while editing e.g. tab or bs, can be used to delete 2 spaces in a tab, if set to -1, shiftwidth value is used
set expandtab " to insert space characters when tab is pressed, normal tab = Ctrl-V<Tab>

" set number " number of lines
set relativenumber " number of lines relative to cursor

set encoding=utf-8
set fileencoding=utf-8

set mouse=a " use mouse normally
set ignorecase " ignore case when searching
set smartcase
set incsearch
set cursorline " set cursorline
set nocompatible
set encoding=utf-8
set t_Co=256
set laststatus=2 " always set status line
set noshowmode " not show vim's status e.g. insert, normal
set background=light

" reduct delay when swtiching from insert to normal mode with esc
set timeoutlen=1000
set ttimeoutlen=5
" can also use below line
" set noesckeys

" esc in insert mode
inoremap jk <esc>
inoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
cnoremap jk <C-C>

" Function to detect desktop session type (X11 or Wayland)
function! GetDesktopSession()
  if exists('$WAYLAND_DISPLAY')
    return 'wayland'
  elseif exists('$DISPLAY')
    return 'x11'
  else
    return 'unknown'
  endif
endfunction

" Get the desktop session type
let s:desktop_session = GetDesktopSession()

" Echo different messages based on the session type
if s:desktop_session == 'x11'
    " copy to system clipboard (X11) using "+y
    " install xclip (if haven't already)
    map "+y y:call system("xclip -selection clip-board", @")<CR>

elseif s:desktop_session == 'wayland'
    " copy to system cliboard (wayland)
    " map works in all mode, install wl-clipboard first, remove backslash
    map \"+y y:call system("wl-copy", @")<CR>

else
  echom "Unknown desktop session"
endif

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'inspire'] ]
      \ },
      \ 'component': {
      \   'inspire': 'Keep Breathing ☺ |',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }


function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! ToggleBackgroundTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
endfunction


map <F12> :call ToggleBackgroundTheme() <CR>
nnoremap <F4> :NERDTreeToggle<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" vim key bindings when switching between tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Ignore errors latex
let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8
