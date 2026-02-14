# AGENTS.md

本文档为 Qoder (qoder.com) 提供本仓库的代码指导。

## 项目概述

这是一个基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的 Neovim 配置。所有配置文件均使用 Lua 编写。

## 代码格式化

- 使用 **StyLua** 进行 Lua 代码格式化，配置位于 `stylua.toml`：
  - 缩进：2 个空格
  - 列宽：120

格式化文件：`stylua <file.lua>`

## 架构

### 目录结构

```
~/.config/nvim/
├── init.lua                 # 入口文件 - 引导加载 lazy.nvim 和 LazyVim
├── lazy-lock.json           # 插件版本锁定文件（类似 package-lock.json）
├── stylua.toml              # Lua 格式化器配置
├── lua/
│   ├── config/              # 核心配置
│   │   ├── lazy.lua         # lazy.nvim 设置和插件规范加载
│   │   ├── autocmds.lua     # 自定义自动命令
│   │   ├── keymaps.lua      # 自定义快捷键（删除了部分 LazyVim 默认键位）
│   │   └── options.lua      # 自定义 vim 选项
│   ├── plugins/             # 插件规范
│   │   ├── editor.lua       # 编辑器插件（fzf-lua、neo-tree 等）
│   │   ├── ui.lua           # UI/主题配置（gruvbox、tmux-navigator）
│   │   ├── lsp.lua          # LSP 配置
│   │   ├── git.lua          # Git 插件（vim-fugitive）
│   │   ├── java.lua         # Java 相关（nvim-jdtls、neotest-java）
│   │   ├── sql.lua          # SQL 工具（vim-dadbod-ui）
│   │   ├── note.lua         # Obsidian.nvim 笔记配置
│   │   └── example.lua      # 插件规范示例（已禁用）
│   └── snippets/            # LuaSnip 代码片段
│       └── java.lua         # Java 代码片段，自动生成包名/类名
```

### 核心架构模式

1. **LazyVim 插件系统**：插件以 Lua 表格形式定义在 `lua/plugins/` 下的文件中。每个文件返回一个插件规范表格，由 lazy.nvim 自动加载。

2. **插件规范格式**：每个插件定义包含：
   - 插件名称（如 `"folke/which-key.nvim"`）
   - `opts` 表格用于配置（与默认值合并）
   - `keys` 用于懒加载快捷键
   - `config` 或 `init` 函数用于设置逻辑

3. **LazyVim Extras**：配置在 `lua/config/lazy.lua` 中导入了多个 LazyVim 扩展：
   - `lang.python`、`lang.java`、`lang.vue`、`lang.yaml`、`lang.sql`
   - `coding.luasnip`、`coding.mini-surround`
   - `editor.outline`
   - `test.core`、`dap.core`

4. **自定义代码片段**：LuaSnip 代码片段定义在 `lua/snippets/` 中，通过插件规范加载。Java 代码片段可从文件路径自动检测包名。

5. **Obsidian 集成**：自定义笔记工作流，工作空间定义在 `lua/plugins/note.lua`：
   - 工作空间：`cmsi`、`personal`、`hbjg`、`ctfo`
   - 自定义 `OpenMondayNote` 命令可为工作空间打开周一笔记

## 常用开发任务

### 添加新插件

在 `lua/plugins/` 创建新文件或添加到现有文件：

```lua
return {
  {
    "author/plugin-name",
    opts = {
      -- 插件选项
    },
  },
}
```

### 修改 LSP 设置

编辑 `lua/plugins/lsp.lua` - 使用 `neovim/nvim-lspconfig` 配合 LazyVim 的 LSP 设置。

### 添加自定义代码片段

在 `lua/snippets/` 中编辑或创建文件，使用 LuaSnip 格式：

```lua
local ls = require("luasnip")
ls.add_snippets("filetype", {
  ls.snippet("trigger", {
    -- 代码片段节点
  }),
})
```

### 更新插件

在 Neovim 中运行 `:Lazy update` 或删除 `lazy-lock.json` 后重启。

## 关键依赖

- **lazy.nvim**：插件管理器
- **LuaSnip**：代码片段引擎
- **nvim-lspconfig**：LSP 配置
- **mason.nvim**：LSP 服务器/包管理器
- **fzf-lua**：模糊查找器（替代 telescope）
- **neo-tree.nvim**：文件浏览器
- **obsidian.nvim**：笔记集成
