require "nvchad.mappings"

local map = vim.keymap.set

local function save_all_and_exit()

  -- Close all nvterm terminals
  -- FIXME: A reconfigurer
  -- local nvterm = require("nvterm.terminal")
  -- nvterm.close_all_terms()

  -- Save all and exit
  vim.api.nvim_input('<ESC>')
  vim.cmd(":wqa!<CR>")

end

-- Neovim Terminal emulator mappings
--
-- see https://neovim.io/doc/user/nvim_terminal_emulator.html
map( { "i", "n", "t" }, "<A-h>", "<C-\\><C-N><C-w>h", { desc = "Navigate to left Window"   } )
map( { "i", "n", "t" }, "<A-j>", "<C-\\><C-N><C-w>j", { desc = "Navigate to bottom Window" } )
map( { "i", "n", "t" }, "<A-k>", "<C-\\><C-N><C-w>k", { desc = "Navigate to top Window"    } )
map( { "i", "n", "t" }, "<A-l>", "<C-\\><C-N><C-w>l", { desc = "Navigate to right Window"  } )

-- Copilot
--
-- https://github.com/github/copilot.vim
-- https://www.reddit.com/r/neovim/comments/12vcybk/how_to_get_copilot_to_work_on_nvchad/
map(
  "i",
  "<A-a>",
  function()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
  end,
  {
    desc = "Accept Copilot suggestion",
    expr = true,
    script = true,
    silent = true,
    nowait = true,
    replace_keycodes = false
  }
)

-- Save all and exit
map(
  { "i", "n", "t" },
  "<A-z>z",
  save_all_and_exit, {
    desc = "Save all and exit"
    -- opts = {
    --   nowait = true
    -- }
  }
)
