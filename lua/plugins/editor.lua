return {
  { "folke/persistence.nvim", enabled = false },
  { "lilydjwg/fcitx.vim" },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { shorten = 1 },
        file_ignore_patterns = { "node_modules", "target", "dist" },
      },
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Switch Buffer" },
      { "<leader>sC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>gs", false },
    },
  },

  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },

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
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = false,
      enable_diagnostics = false,
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["x"] = "open_split",
          ["v"] = "open_vsplit",
        },
      },
      filesystem = {
        group_empty_dirs = true,
        -- follow_current_file = { enabled = false },
      },
    },
    keys = {
      { "<leader>fs", "<cmd>Neotree focus<cr>", desc = "Show in Neotree" },
    },
  },
  { "tpope/vim-abolish" },
  { "mg979/vim-visual-multi" },
}
