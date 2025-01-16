return {
  { "lewis6991/gitsigns.nvim", enabled = false },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = "Git",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true,
    keys = {
      { "<leader>gs", "<cmd>Neogit cwd=%:p:h<cr>", desc = "Neogit Status" },
    },
  },
}
