-- minuet-ai.lua
--
-- https://github.com/milanglacier/minuet-ai.nvim
return {
  "milanglacier/minuet-ai.nvim",
  lazy = false,
  -- dependencies = {
  --   -- optional, if you are using virtual-text frontend, nvim-cmp is not required.
  --   "hrsh7th/nvim-cmp",
  --
  --   -- optional, if you are using virtual-text frontend, blink is not required.
  --   "Saghen/blink.cmp",
  -- },
  config = function()
    require('minuet').setup {
      provider = 'codestral',
      provider_options = {
        codestral = {
          model = 'codestral-latest',
          end_point = 'https://codestral.mistral.ai/v1/fim/completions',
          api_key = function()
            local filePath = os.getenv("HOME") .. "/.codestral_api_key"
            local file = io.open(filePath)

            if not file then
              error("Fail to read file at path '" .. filePath .. "'!")
            end

            local api_key = file:read("*a")
            file:close()
            return api_key:gsub("%s+", "")
          end,
          stream = true,
          optional = {
            stop = { '\n\n' },
            max_tokens = 256,
          },
        },
      },
      virtualtext = {

        -- Auto-complete is only enabled on the specific file types
        --
        -- Use ':echo &filetype' to get the detected file type when you're in a file.
        --
        -- @see https://neovim.io/doc/user/filetype/
        auto_trigger_ft = {
          'terraform', 'sh',
        },
        keymap = {
          -- accept whole completion
          accept = '<A-A>',
          -- accept one line
          accept_line = '<A-a>',
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
    }
  end,
}
