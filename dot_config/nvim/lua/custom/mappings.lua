local M = {}

local function save_all_and_exit()

  -- Close all nvterm terminals
  local nvterm = require("nvterm.terminal")
  nvterm.close_all_terms()

  -- Save all and exit
  vim.api.nvim_input('<ESC>')
  vim.cmd(":wqa!<CR>")

end

M.general = {
  i = {
    -- Neovim Terminal emulator mappings
    --
    -- see https://neovim.io/doc/user/nvim_terminal_emulator.html
    ["<A-h>"] = { "<C-\\><C-N><C-w>h", "Navigate to left Window" },
    ["<A-j>"] = { "<C-\\><C-N><C-w>j", "Navigate to bottom Window" },
    ["<A-k>"] = { "<C-\\><C-N><C-w>k", "Navigate to top Window" },
    ["<A-l>"] = { "<C-\\><C-N><C-w>l", "Navigate to right Window" },

    -- Save all and exit
    ["<A-z>z"] = {
      save_all_and_exit,
      "Save all and exit",
      opts = {
        nowait = true
      }
    },

    -- Copilot
    --
    -- https://github.com/github/copilot.vim
    ["<A-a>"] = {
      "copilot#Accept()",
      "Accept Copilot suggestion",
      opts = {
        expr = true,
        script = true,
        silent = true,
        nowait = true,
        replace_keycodes = false
      }
    },
  },

  n = {
    -- Neovim Terminal emulator mappings
    --
    -- see https://neovim.io/doc/user/nvim_terminal_emulator.html
    ["<A-h>"] = { "<C-w>h", "Navigate to left Window" },
    ["<A-j>"] = { "<C-w>j", "Navigate to bottom Window" },
    ["<A-k>"] = { "<C-w>k", "Navigate to top Window" },
    ["<A-l>"] = { "<C-w>l", "Navigate to right Window" },

    -- Save all and exit
    ["<A-z>z"] = {
      save_all_and_exit,
      "Save all and exit"
    },

  }
}
M.nvterm = {
  t = {
    -- Neovim Terminal emulator mappings
    --
    -- see https://neovim.io/doc/user/nvim_terminal_emulator.html
    ["<A-h>"] = { "<C-\\><C-N><C-w>h", "Navigate to left Window" },
    ["<A-j>"] = { "<C-\\><C-N><C-w>j", "Navigate to bottom Window" },
    ["<A-k>"] = { "<C-\\><C-N><C-w>k", "Navigate to top Window" },
    ["<A-l>"] = { "<C-\\><C-N><C-w>l", "Navigate to right Window" },

    -- Save all and exit
    ["<A-z>z"] = {
      save_all_and_exit,
      "Save all and exit",
      opts = {
        nowait = true
      }
    },
  }
}

return M
