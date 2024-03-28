-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.root_spec = { "lsp", { ".root", ".git", "lua" }, "cwd" }

opt.number = false
opt.relativenumber = false
opt.spell = false
opt.signcolumn = "no"
opt.splitbelow = false
opt.cursorline = false
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldmethod = "expr"
