imap  jj <Esc> 

" Terminal Color
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

set number relativenumber
nnoremap <CR> ciw
nnoremap MM yyp
set nowrap
let mapleader = " "
set background=dark
set cursorline
set incsearch
set hlsearch

" Sane HJKL
nnoremap L $
onoremap L $
xnoremap L $
nnoremap H 0
onoremap H 0
xnoremap H 0
nnoremap K gg 
onoremap K gg 
xnoremap K gg 
nnoremap J G 
onoremap J G 
xnoremap J G 

nnoremap q <silent> 
onoremap q <silent> 
xnoremap q <silent> 

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Tags<CR>

" Easy Motion
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" Fixes Background Color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox8
