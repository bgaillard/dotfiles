local M = {}

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
    ["<A-z>z"] = { "<ESC> :wqa!<CR>", "Save all and exit" },
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
    ["<A-z>z"] = { ":wqa!<CR>", "Save all and exit" },
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
  }
}

return M
