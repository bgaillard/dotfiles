-- nvim-neoclip.lua
--
-- https://github.com/AckslD/nvim-neoclip.lua
return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("neoclip").setup()
  end,
}
