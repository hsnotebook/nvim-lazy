return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      folds = {
        enabled = false,
      },
      inlay_hints = { enabled = false },
      diagnostics = {
        underline = false,
        virtual_text = { current_line = true },
      },
    },
  },
}
