-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("hs_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("java"),
  pattern = { "java" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- `vim.opt.spell = false` in options.lua does not work.
-- So use autocmds to config `spell`
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("spell"),
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
