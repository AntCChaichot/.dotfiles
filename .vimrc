"Get the defaults that most users want. (Uncomment line below)
" source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

syntax on
filetype indent on
set autoindent "copy indent from current line when starting a new line 
set shiftwidth=0 "number of spaces used for each step of autoindent, if 0, tabstop value is used
set tabstop=2 "number of spaces the fule counts for
set softtabstop=-1 "number of spaces a <tab> counts while editing e.g. tab or bs
"can be used to delete 2 spaces in a tab, if set to -1, shiftwidth value is used
set expandtab "to insert space characters when tab is pressed, normal tab = Ctrl-V<Tab>

set number "number of lines

set encoding=utf-8
set fileencoding=utf-8

set mouse=a "use mouse normally
set ignorecase
set smartcase
set incsearch
set cursorline
set nocompatible
set encoding=utf-8
set t_Co=256
set laststatus=2
set noshowmode
set background=light

" reduct delay when swtiching from insert to normal mode with esc
set timeoutlen=1000
set ttimeoutlen=5
" can also use below line
" set noesckeys

let g:kite_supported_languages = ['*']

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'inspire', 'kite' ] ]
      \ },
      \ 'component': {
      \   'inspire': 'Fighting!',
      \   'kite': '%{kite#statusline()}',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

let g:rainbow_active = 1

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! ToggleBackgroundTheme()
  let &background = ( &background == "dark"? "light" : "dark" )
endfunction

map <F12> :call ToggleBackgroundTheme() <CR>
nnoremap <C-t> :NERDTreeToggle<CR>
