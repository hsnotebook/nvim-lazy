local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- 获取当前文件路径并转换为包名
local get_package_name = function()
  -- 获取当前文件的绝对路径
  local file_path = vim.fn.expand("%:p")
  -- 找到项目中的源代码根目录（例如 "src/main/java" 或 "java"）
  local java_root_patterns = { "src/main/java", "src/test/java", "java" }

  for _, pattern in ipairs(java_root_patterns) do
    local start_pos = file_path:find(pattern)
    if start_pos then
      -- 提取包路径部分
      local package_path = file_path:sub(start_pos + pattern:len() + 1)
      -- 移除文件名部分，只保留目录路径
      package_path = package_path:match("(.*)/")
      if package_path then
        -- 将路径分隔符替换为点，形成包名
        return package_path:gsub("/", ".")
      end
    end
  end

  -- 如果无法确定包名，提供默认值
  return "top.hsnotebook"
end

-- 获取当前文件名（不含扩展名）作为类名
local get_class_name = function()
  local filename = vim.fn.expand("%:t:r") -- 获取当前文件名（不含路径和扩展名）
  if filename == "" then
    return "ClassName" -- 默认类名
  end

  -- 可选：将文件名转换为驼峰命名（如：my_class -> MyClass）
  local className = string.gsub(filename, "_(%a)", function(letter)
    return string.upper(letter)
  end)
  className = string.gsub(className, "^(%a)", function(letter)
    return string.upper(letter)
  end)

  return className
end

ls.add_snippets("java", {
  s(
    "class",
    fmt(
      [[
package {};

/**
 * {}
 *
 * @author HuangShuai
 * @version 1.0
 * @since {}
 */
public class {} {{

  {}

}}
    ]],
      {
        f(get_package_name),
        i(1, "class description"),
        t(os.date("%Y-%m-%d")),
        f(get_class_name),
        i(0),
      }
    )
  ),
}, {
  description = "Generate Java class with package info",
  docstring = "Java class template with automatic package detection",
})

return {}
