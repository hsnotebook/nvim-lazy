return {
  {
    "lilydjwg/fcitx.vim",
    config = function()
      vim.opt.ttimeoutlen = 100
    end,
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        fd_opts = [[--color=never --type f --hidden --follow -E .git -E .obsidian]],
        actions = {
          ["ctrl-x"] = require("fzf-lua").actions.file_split,
        },
      },
      buffers = {
        actions = {
          ["ctrl-x"] = require("fzf-lua").actions.file_split,
          ["ctrl-d"] = { fn = require("fzf-lua").actions.buf_del, reload = true },
        },
      },
    },
    keys = {
      { "<leader>gc", false },
      { "<leader>gs", false },
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

  {
    "hedyhli/outline.nvim",
    optional = true,
    opts = {
      keymaps = {
        up_and_jump = "<c-k>",
        down_and_jump = "<c-j>",
      },
    },
  },
  { "lambdalisue/vim-suda" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-abolish" },
  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "tmux"
    end,
  },
  { "gcmt/taboo.vim" },
}
