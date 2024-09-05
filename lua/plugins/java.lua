return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      vim.list_extend(
        opts.cmd,
        { "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")) }
      )
    end,
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-java" } },
  },
}
