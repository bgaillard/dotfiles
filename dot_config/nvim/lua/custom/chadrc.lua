-- see https://github.com/NvChad/example_config
local M = {}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = "tokyonight",
  transparency = true,

  nvdash = {
    load_on_startup = true,
  }
}

-- Force to re-enable Netrw to make the 'gx' shortcut work
--
-- see https://github.com/NvChad/NvChad/issues/1865
M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = vim.tbl_filter(function(name)
        return string.sub(name, 1, 5) ~= "netrw"
      end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
    },
  },
}

return M
