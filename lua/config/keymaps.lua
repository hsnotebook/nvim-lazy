-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>wm", "<cmd>only<cr>", { desc = "Maximize window" })
vim.keymap.set("n", "<leader>ww", "<cmd>w<cr>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>wl", "<C-w>L", { desc = "Move window to right" })
vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = "Move window to left" })
vim.keymap.set("n", "<leader>wk", "<C-w>K", { desc = "Move window to up" })
vim.keymap.set("n", "<leader>wj", "<C-w>J", { desc = "Move window to blow" })

vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gf")
