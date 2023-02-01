require("neotest").setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      args = { "--disable-warnings" },
      runner = "pytest",
      python = "python",
    },
  },
}
