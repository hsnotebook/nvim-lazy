local myWorkspaces = {
  { name = "cmsi", path = "~/wiki/jobs/cmsi", tag = "job" },
  { name = "personal", path = "~/wiki/personal", tag = "life" },
  { name = "hbjg", path = "~/wiki/jobs/hbjg", tag = "job" },
  { name = "ctfo", path = "~/wiki/jobs/ctfo", tag = "job" },
}

local function get_current_workspace_info()
  local current_workspace = Obsidian.workspace

  for _, ws in pairs(myWorkspaces) do
    -- 将配置中的路径展开为绝对路径，并进行比较
    if ws.name == current_workspace.name then
      return ws
    end
  end
  return nil -- 没有找到匹配的工作空间
end

local function OpenMondayNote()
  local ws_info = get_current_workspace_info()
  if ws_info and ws_info.tag == "job" then
    -- 获取当前日期和时间
    local now = os.date("*t")
    local current_wday = now.wday

    -- 计算到本周一的偏移天数
    -- 注意: os.date 中 wday 为 1(周日) 到 7(周六)
    local offsetDays
    if current_wday == 1 then
      offsetDays = -6
    else
      offsetDays = -(current_wday - 2) -- 2 对应周一
    end
    local command = "silent ObsidianToday " .. offsetDays
    vim.cmd(command)
  -- 执行打开周一日记的逻辑
  else
    vim.cmd("silent ObsidianToday")
  end
end

vim.api.nvim_create_user_command("OpenMondayNote", function(opts)
  OpenMondayNote()
end, {})

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
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    lazy = false,
    opts = {
      workspaces = myWorkspaces,
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
      footer = {
        enabled = false, -- 关键：设置为 false 即可隐藏底部统计栏
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
      { "<leader>nw", "<cmd>Obsidian workspace<cr>", desc = "Change Workspace" },
      -- { "<leader>ni", "<cmd>Obsidian today<cr>", desc = "Open Today Note" },
      { "<leader>ni", OpenMondayNote, desc = "Open Today Note" },
      { "<leader>nf", "<cmd>Obsidian quick_switch<cr>", desc = "Find Notes" },
      { "<leader>n/", "<cmd>Obsidian search<cr>", desc = "Search Notes" },
      { "<leader>no", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian" },
    },
  },

  { "hotoo/pangu.vim" },
}
