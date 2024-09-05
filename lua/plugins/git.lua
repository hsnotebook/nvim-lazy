return {
  { "lewis6991/gitsigns.nvim", enabled = false },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = "Git",
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gs", false },
    },
  },
}
