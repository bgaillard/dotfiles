-- https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f
-- https://github.com/rockerBOO/awesome-neovim

return {

  -- auto-save
  --
  -- https://github.com/Pocco81/auto-save.nvim
  ["Pocco81/auto-save.nvim"] = {
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },

  -- diffview.nvim
  --
  -- https://github.com/sindrets/diffview.nvim
  ["sindrets/diffview.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    after = "plenary.nvim",
    opt = false,
    config = function()
      require("diffview").setup {}
    end,
  },

  -- FixCursorHold.nvim
  --
  -- https://github.com/antoinemadec/FixCursorHold.nvim
  ["antoinemadec/FixCursorHold.nvim"] = {},

  -- lspconfig
  --
  -- https://github.com/neovim/nvim-lspconfig
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- neotest
  --
  -- https://github.com/nvim-neotest/neotest
  ["nvim-neotest/neotest"] = {
    requires = {

      -- required dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- adapters
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-go"),
          require("neotest-rust"),
        }
      })
    end,
  },
  ["nvim-neotest/neotest-python"] = {},
  ["nvim-neotest/neotest-go"] = {},
  ["rouge8/neotest-rust"] = {},

  -- null-ls
  --
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- popup.nvim
  --
  -- https://github.com/nvim-telescope/telescope-media-files.nvim
  ["nvim-lua/popup.nvim"] = {},

  -- spellsitter
  --
  -- https://github.com/lewis6991/spellsitter.nvim
  ["lewis6991/spellsitter.nvim"] = {
    config = function()
      require('spellsitter').setup()
    end
  },

  -- tmux.nvim
  --
  -- https://github.com/aserowy/tmux.nvim
  ["aserowy/tmux.nvim"] = {
    config = function()
      require('tmux').setup({
        copy_sync = {
          enable = true
        }
      })
    end

  },

  -- trouble
  --
  -- https://github.com/folke/trouble.nvim
  ["folke/trouble.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
}
