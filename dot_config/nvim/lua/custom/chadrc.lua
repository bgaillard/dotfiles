-- see https://github.com/NvChad/example_config
local M = {}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = "tokyonight",
  transparency = true
}

return M
