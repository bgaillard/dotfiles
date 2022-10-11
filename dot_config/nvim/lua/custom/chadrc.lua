-- see https://github.com/NvChad/example_config
local M = {}

M.plugins = require "custom.plugins"

M.ui = {
  theme = "dark_horizon",
  transparency = true
}

-- M.plugins = {
--   user = require "custom.plugins",
--
--   override = {
--
--
--   }
-- }

return M
