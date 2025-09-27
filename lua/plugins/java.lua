return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.root_dir = function(fname)
        require("lspconfig.util").root_pattern(".git", "pom.xml", "build.gradle")(fname)
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-java" } },
  },
}
