return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.root_dir = function()
        return vim.fs.dirname(vim.fs.find({ ".root", ".git", "pom.xml" }, { upward = true })[1])
      end
      vim.list_extend(
        opts.cmd,
        { "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")) }
      )
    end,
  },

  { "rcasia/neotest-java", lazy = true, ft = "java" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-java" } },
  },
}
