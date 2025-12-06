local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.coding.luasnip" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.lang.python" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.lang.java" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.lang.vue" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.lang.yaml" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.lang.sql" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.test.core" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.dap.core" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.coding.mini-surround" },
    { "LazyVim/LazyVim", import = "lazyvim.plugins.extras.editor.outline" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
