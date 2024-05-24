return {
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
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["x"] = "open_split",
          ["v"] = "open_vsplit",
        },
      },
      filesystem = {
        follow_current_file = { enabled = false },
        group_empty_dirs = true,
      },
    },
  },
  -- {
  --   "preservim/nerdtree",
  --   keys = {
  --     { "<leader>fe", "<cmd>lua vim.cmd('NERDTreeToggle '..LazyVim.root())<cr>", desc = "Explore NERDTree (Root Dir)" },
  --     { "<leader>fE", "<cmd>lua vim.cmd('NERDTreeToggle '..vim.uv.cwd())<cr>", desc = "Explore NERDTree (cwd)" },
  --     { "<leader>fs", "<cmd>NERDTreeFind<cr>", desc = "Show in NERDTree" },
  --   },
  -- },

  { "tpope/vim-abolish" },
  { "mg979/vim-visual-multi" },
}
