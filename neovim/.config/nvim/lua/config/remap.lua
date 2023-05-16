vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", "<Nop>", { noremap = true, silent = true }) -- This disables macros
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.api.nvim_set_keymap("n", "<CR>", "<CR><Cmd>cclose<CR>", { noremap = false, silent = true })
