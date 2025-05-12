vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.confirm = true
vim.g.editorconfig = false

if vim.g.neovide == true then
	vim.g.neovide_hide_mouse_when_typing = true
	vim.o.guifont = "Hack Nerd Font:h17"
	vim.api.nvim_set_keymap("n", "<leader><leader>;", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_command_line = false
	vim.cmd([[ inoremap <CS-V> <c-r>+ ]])
	vim.cmd([[ cnoremap <CS-V> <c-r>+ ]])
	vim.cmd([[nmap <CS-V> "+p]])
end
