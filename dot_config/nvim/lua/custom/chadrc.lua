local M = {}

M.plugins = {
  user = require "custom.plugins",

  override = {

    -- nvim-tree
    ["kyazdani42/nvim-tree.lua"] = {
      git = {
        enable = true,
      },
      renderer = {
        icons = {
          show = {
            git = true,
          }
        }
      }
    }

  }
}

M.ui = {
  theme = "gatekeeper"
}

return M
