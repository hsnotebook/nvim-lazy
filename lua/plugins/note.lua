return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>n", group = "notes" },
      },
    },
  },

  {
    -- "epwalsh/obsidian.nvim",
    -- version = "*", -- recommended, use latest release instead of latest commit
    "hsnotebook/obsidian.nvim",
    lazy = false,
    opts = {
      workspaces = {
        {
          name = "hbjg",
          path = "~/wiki/jobs/hbjg",
        },
        {
          name = "personal",
          path = "~/wiki/personal",
        },
        {
          name = "ctfo",
          path = "~/wiki/jobs/ctfo",
        },
      },
      notes_subdir = "0.inbox",
      daily_notes = {
        folder = "diary",
        date_format = "%Y-%m-%d",
      },
      attachments = {
        img_folder = "assets/images",
        img_name_func = function()
          return string.format("%s-", os.date("%Y%m%d%H%M%S"))
        end,
      },
      wiki_link_func = "prepend_note_id",
      follow_url_func = function(url)
        vim.print(url)
        if url:find("^file:") ~= nil then
          url = string.sub(url, 8)
          if url:find("%.uxf$") ~= nil then
            vim.fn.jobstart({ "umlet", url })
          else
            vim.fn.jobstart({ "xdg-open", url })
          end
        else
          vim.fn.jobstart({ "xdg-open", url })
        end
      end,
      follow_img_func = function(img)
        vim.fn.jobstart({ "xdg-open", img })
      end,
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- title 保留中文
          suffix = title:gsub(" ", "-"):gsub("[^\u{4e00}-\u{9fff}A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return os.date("%Y%m%d") .. "-" .. suffix
      end,
    },
    keys = {
      { "<leader>nw", "<cmd>ObsidianWorkspace<cr>", desc = "Change Workspace" },
      { "<leader>ni", "<cmd>ObsidianToday<cr>", desc = "Open Today Note" },
      { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Notes" },
      { "<leader>n/", "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
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

  { "hotoo/pangu.vim" },
}
