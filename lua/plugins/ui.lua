return {
  -- theme
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

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

  -- do not like
  { "akinsho/bufferline.nvim", enabled = false },

  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
}
