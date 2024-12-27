-- diffview.nvim
--
-- https://github.com/sindrets/diffview.nvim
return{
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  lazy = false,
  config = function()
    require("diffview").setup {}
  end,
}
