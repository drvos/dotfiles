vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.g.mapleader = " "

vim.g.background = "light"

vim.keymap.set('n', '<leader>pp', ':setlocal paste!<CR>')
vim.keymap.set('n', '<leader><enter>', ':nohlsearch<CR>')
vim.wo.number = true
vim.opt.swapfile = false
