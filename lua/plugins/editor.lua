return {
  {
    "lilydjwg/fcitx.vim",
    config = function()
      vim.opt.ttimeoutlen = 100
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "target" },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["x"] = "open_split",
          ["v"] = "open_vsplit",
        },
      },
      filesystem = {
        follow_current_file = { enabled = false },
        group_empty_dirs = true,
      },
    },
    keys = {
      { "<leader>fs", "<cmd>Neotree reveal_force_cwd<cr>", desc = "Show in Neotree" },
    },
  },
}
