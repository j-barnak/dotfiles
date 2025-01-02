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

" Macro is Q (uppercase)
nnoremap q <nop>
nnoremap Q q

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-commentary'
call plug#end()

nmap <leader>cc <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>Commentary

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Tags<CR>

" Fixes Background Color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox8

cnoremap W! w!
cnoremap W1 w!
cnoremap w1 w!
cnoremap Q! q!
cnoremap Q1 q!
cnoremap q1 q!
cnoremap Qa! qa!
cnoremap Qall! qall!
cnoremap Wa wa
cnoremap Wq wq
cnoremap wQ wq
cnoremap WQ wq
cnoremap wq1 wq!
cnoremap Wq1 wq!
cnoremap wQ1 wq!
cnoremap WQ1 wq!
cnoremap W w
cnoremap Q q
cnoremap Qa qa
cnoremap Qall qall

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
nnoremap <leader>fe :NERDTreeFocus<CR>
" Automatically close NERDTree when opening file from NERDTree 
let g:NERDTreeQuitOnOpen = 1

" Format on Save
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \ "Standard" : "C++11"}

" Map <leader><leader> to clear search highlighting and unmaps eassymotion 
map <Leader>s <Plug>(easymotion-prefix)
nnoremap <leader><leader> :noh<CR>

let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)
