-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Pressing <esc>j or <esc>k quickly will tringer this keymap, I don't like it
vim.keymap.del({ "i", "n", "v" }, "<A-k>")
vim.keymap.del({ "i", "n", "v" }, "<A-j>")
