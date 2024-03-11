imap  jj <Esc> 

let mapleader = " "
set number relativenumber
set nowrap
set background=dark
set cursorline
set incsearch
set hlsearch

" Terminal Color
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

nmap <leader><leader> :noh<CR>
nnoremap <CR> ciw
nnoremap MM yyp

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

cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
