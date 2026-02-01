" ------- Notes -------
" :PlugInstall
" :PlugUpdate
" :PlugClean
" :PlugUpgrade
" :PlugStatus

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set whichwrap+=<,>,[,]
set encoding=UTF-8

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'preservim/tagbar'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" Pick ONE colorscheme plugin (see below).
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" Keybinds
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Color
set termguicolors
set background=dark
colorscheme gruvbox
" If you stick with awesome-vim-colorschemes, you can try:
" colorscheme atom

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:NerdTreeDirArrowExpandable="+"
let g:NerdTreeDirArrowCollapsible="~"

set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect

