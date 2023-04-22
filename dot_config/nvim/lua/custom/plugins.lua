return {

  -- auto-save
  --
  -- https://github.com/Pocco81/auto-save.nvim
  {
    -- see https://github.com/Pocco81/auto-save.nvim/issues/56
    --"Pocco81/auto-save.nvim",
    "zoriya/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true,
        callbacks = {
          before_saving = function()
            return vim.lsp.buf.formatting_sync()
          end
        }
      }
    end,
    lazy = false
  },

  -- diffview.nvim
  --
  -- https://github.com/sindrets/diffview.nvim
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    lazy = false,
    config = function()
      require("diffview").setup {}
    end,
  },

  -- Fugitive
  --
  -- https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
    lazy = false
  },

  -- Leap
  --
  -- https://github.com/ggandor/leap.nvim
  --
  -- FIXME: Disabled because the 'x' character does not work to delete when we are in selection mode.
  --
  -- {
  --   "ggandor/leap.nvim",
  --   lazy = false,
  --   config = function ()
  --     require('leap').add_default_mappings()
  --   end
  -- },

  -- neotest
  --
  -- https://github.com/nvim-neotest/neotest
  {
    "nvim-neotest/neotest",
    dependencies = {

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
    dependencies = {
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

  -- Tokyo Night
  --
  -- see https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          style = "night"
        }
      })
    end,
  },

  -- trouble
  --
  -- https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
}
