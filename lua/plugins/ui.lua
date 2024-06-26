return {
  -- tabpage
  { "gcmt/taboo.vim" },
  { "akinsho/bufferline.nvim", enabled = false },

  -- theme
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },

  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
}
