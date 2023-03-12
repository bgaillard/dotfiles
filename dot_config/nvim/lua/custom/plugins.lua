return {

  -- auto-save
  --
  -- https://github.com/Pocco81/auto-save.nvim
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
    lazy = false
  },

  -- diffview.nvim
  --
  -- https://github.com/sindrets/diffview.nvim
  {
    "sindrets/diffview.nvim",
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
  {
    "antoinemadec/FixCursorHold.nvim",
  },

  -- Fugitive
  --
  -- https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
  },

  -- Leap
  --
  -- https://github.com/ggandor/leap.nvim
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      require('leap').add_default_mappings()  
    end
  },

  -- neotest
  --
  -- https://github.com/nvim-neotest/neotest
  {
    "nvim-neotest/neotest",
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

  -- nvim-neoclip.lua
  --
  -- https://github.com/AckslD/nvim-neoclip.lua
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("neoclip").setup()
    end,
  },

  -- Surround
  --
  -- https://github.com/tpope/vim-surround
  {
    "tpope/vim-surround",
    {},
  },

  -- tmux.nvim
  --
  -- https://github.com/aserowy/tmux.nvim
  {
    "aserowy/tmux.nvim",
    config = function()
      require('tmux').setup({
        copy_sync = {
          enable = true
        }
      })
    end,
  },

  -- trouble
  --
  -- https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
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
