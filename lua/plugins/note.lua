return {
  { "lukas-reineke/headlines.nvim", enabled = false },
  -- disable markdownlint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "vimwiki", "markdown" },
    keys = {
      {
        "<leader>np",
        ft = "vimwiki",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
  {
    "vimwiki/vimwiki",
    enabled = false,
    lazy = false,
    init = function()
      vim.cmd([[
        let wiki = { 'name': 'wiki', 'path': '~/wiki', 'auto_toc': 1, 'syntax': 'markdown', 'ext': 'md' }
        let g:vimwiki_list = [wiki]
        let g:vimwiki_html_header_numbering = 1
        let g:vimwiki_markdown_link_ext = 1
        let g:vimwiki_map_prefix = '<leader>n'
        let wiki.nested_syntaxes = {'bash':'bash', 'python': 'python', 'lua': 'lua', 'java': 'java', 'plantuml': 'plantuml', 'xml': 'xml', 'yaml': 'yaml', 'js': 'javascript', 'json': 'json'}
        ]])
    end,
    keys = {
      { "<leader>ni", "<cmd>e ~/wiki/0.inbox/Inbox.md<cr>", desc = "Open Inbox" },
      { "<leader>nd", "<cmd>VimwikiDeleteFile<cr>", desc = "Delete Wiki File" },
      {
        "<leader>nf",
        function()
          require("telescope.builtin").find_files({ prompt_title = "< Find In Notes >", cwd = "~/wiki/" })
        end,
        desc = "Find Notes",
      },
      {
        "<leader>ns",
        function()
          require("telescope.builtin").live_grep({ prompt_title = "< Search In Notes >", cwd = "~/wiki/" })
        end,
        desc = "Search Notes",
      },
      {
        "<leader>no",
        function()
          local fullPath = vim.api.nvim_buf_get_name(0) -- /home/hs/wiki/xxxxx
          local wikipath = string.sub(fullPath, 15)
          local uri = ("obsidian://open?vault=wiki&file=%s"):format(wikipath)
          vim.fn.jobstart("xdg-open" .. " '" .. uri .. "'")
        end,
        desc = "Open in Obsidian",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+notes" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { ".obsidian" },
      },
    },
    keys = {
      { "<leader>ni", "<cmd>e ~/wiki/0.inbox/Inbox.md<cr>", desc = "Open Inbox" },
      {
        "<leader>nf",
        function()
          require("telescope.builtin").find_files({ prompt_title = "< Find In Notes >", cwd = "~/wiki/" })
        end,
        desc = "Find Notes",
      },
      {
        "<leader>ns",
        function()
          require("telescope.builtin").live_grep({ prompt_title = "< Search In Notes >", cwd = "~/wiki/" })
        end,
        desc = "Search Notes",
      },
      {
        "<leader>no",
        function()
          local fullPath = vim.api.nvim_buf_get_name(0) -- /home/hs/wiki/xxxxx
          local wikipath = string.sub(fullPath, 15)
          local uri = ("obsidian://open?vault=wiki&file=%s"):format(wikipath)
          vim.fn.jobstart("xdg-open" .. " '" .. uri .. "'")
        end,
        desc = "Open in Obsidian",
      },
    },
  },
}
