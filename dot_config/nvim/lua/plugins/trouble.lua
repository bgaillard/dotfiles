-- Trouble
--
-- https://github.com/folke/trouble.nvim
return{
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("trouble").setup {}
  end,
  lazy = false
}
