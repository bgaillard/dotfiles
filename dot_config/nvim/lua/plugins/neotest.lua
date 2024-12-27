-- neotest
--
-- https://github.com/nvim-neotest/neotest
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({}),
          require("neotest-go")({}),
          require("neotest-rust")({}),
        }
      })
    end,
  },
}
