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

-- opencode.nvim
-- 
-- @see https://github.com/NickvanDyke/opencode.nvim
map('n', '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
map('n', '<leader>op', function() require('opencode').ask() end, { desc = 'Ask' })
map('n', '<leader>oa', function() require('opencode').ask('@cursor: ') end, { desc = 'Ask opencode about this' })
map('v', '<leader>oa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask opencode about selection' })
map('n', '<leader>on', function() require('opencode').command('session_new') end, { desc = 'New opencode session' })
map('n', '<leader>oy', function() require('opencode').command('messages_copy') end, { desc = 'Copy last opencode response' })
map('n', '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, { desc = 'Messages half page up' })
map('n', '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, { desc = 'Messages half page down' })
map({ 'n', 'v' }, '<leader>os', function() require('opencode').select() end, { desc = 'Select opencode prompt' })

-- Example: keymap for custom prompt
-- vim.keymap.set('n', '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, { desc = 'Explain this code' })

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
