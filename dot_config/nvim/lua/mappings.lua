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


------------------------------------------------------------------------------------------------------------------------
-- NvimTree
--
-- @see https://github.com/nvim-tree/nvim-tree.lua
------------------------------------------------------------------------------------------------------------------------
map(
  "t",
  "<C-n>",
  function()
    local api = require("nvim-tree.api")
    api.tree.toggle()
  end,
  {
    desc = "Open or close NvimTree."
  }
)


------------------------------------------------------------------------------------------------------------------------
-- Tabufline
--
-- :h nvui
------------------------------------------------------------------------------------------------------------------------
map(
  { 'i', 'n', 't' },
  '<Leader>xa',
  function()
    require("nvchad.tabufline").closeAllBufs(true)
  end,
  {
    desc = 'Close all buffers in the current tab.'
  }
)


------------------------------------------------------------------------------------------------------------------------
-- Term
--
-- :h nvui
------------------------------------------------------------------------------------------------------------------------

-- Open floating horizontal terminal
map(
  { 'i', 'n', 't' },
  '<C-h>',
  function()
    require('nvchad.term').toggle {
      pos = "bo sp",
      id = "main-terminal",
      clear_cmd = true,
    }
  end,
  {
    desc = 'Toggle horizontal terminal'
  }
)


------------------------------------------------------------------------------------------------------------------------
-- opencode.nvim
--
-- @see https://github.com/NickvanDyke/opencode.nvim
------------------------------------------------------------------------------------------------------------------------
map(
  'n',
  '<leader>ot',
  function()
    require('opencode').command("session.new")
  end,
  {
    desc = 'Toggle opencode'
  }
)
map('n', '<leader>op', function() require('opencode').ask() end, { desc = 'Ask' })
map('n', '<leader>oa', function() require('opencode').ask('@cursor: ') end, { desc = 'Ask opencode about this' })
map('v', '<leader>oa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask opencode about selection' })
map('n', '<leader>o+', function() require('opencode').prompt('@buffer', { append = true }) end, { desc = 'Add buffer to prompt' })
map('v', '<leader>o+', function() require('opencode').prompt('@selection', { append = true }) end, { desc = 'Add selection to prompt' })
map('n', '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, { desc = 'Explain this code' })
map('n', '<leader>on', function() require('opencode').command('session_new') end, { desc = 'New opencode session' })
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
