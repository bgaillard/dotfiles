-- see https://github.com/NvChad/example_config
local M = {}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = "tokyonight",
  transparency = true,

  hl_override = {
    NvDashAscii = {
      bg = "none",
      fg  = "purple"
    },

    NvDashButtons = {
      bg = "none",
      fg  = "green"
    },

  },

  nvdash = {
    load_on_startup = true,

    -- see https://patorjk.com/software/taag/#p=testall&h=0&c=echo&f=Big&t=Type%20Something%20
    -- see https://github.com/NvChad/NvChad/issues/1930#issuecomment-1510511603
    -- see https://github.com/NvChad/base46/blob/v2.0/lua/base46/themes/tokyonight.lua
    -- header = {
    --   [[                                                    ]],
    --   [[ ██████╗  ███████╗ ██████╗  ██╗  █████╗  ███╗   ██╗ ]],
    --   [[ ██╔══██╗ ██╔════╝ ██╔══██╗ ██║ ██╔══██ ╗████╗  ██║ ]],
    --   [[ ██║  ██║ █████╗   ██████╔╝ ██║ ███████ ║██╔██╗ ██║ ]],
    --   [[ ██║  ██║ ██╔══╝   ██╔══██╗ ██║ ██╔══██ ║██║╚██╗██║ ]],
    --   [[ ██████╔╝ ███████╗ ██████╔╝ ██║ ██║  ██ ║██║ ╚████║ ]],
    --   [[ ╚═════╝  ╚══════╝ ╚═════╝  ╚═╝ ╚═╝  ╚═ ╝╚═╝  ╚═══╝ ]],
    --   [[                                                    ]],
    -- },
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
