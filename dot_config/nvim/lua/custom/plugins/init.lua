-- https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f
-- https://github.com/rockerBOO/awesome-neovim

local overrides = require "custom.plugins.overrides"

return {

  -- nvim-neoclip.lua
  --
  -- https://github.com/AckslD/nvim-neoclip.lua
  ["AckslD/nvim-neoclip.lua"] = {
    requires = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("neoclip").setup()
    end,
  },

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
    override_options = overrides.lspconfig,
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

  -- nvim-tree
  --
  -- https://github.com/kyazdani42/nvim-tree.lua
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree
  },

  -- treesitter
  --
  -- https://github.com/nvim-treesitter/nvim-treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
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

  -- vim-fugitive
  --
  -- https://github.com/tpope/vim-fugitive
  ["tpope/vim-fugitive"] = {},

  -- vim-surround
  --
  -- https://github.com/tpope/vim-surround
  ["tpope/vim-surround"] = {},

  -- telescope-emoji.nvim
  --
  -- https://github.com/xiyaowong/telescope-emoji.nvim
  ["xiyaowong/telescope-emoji.nvim"] = {},

  -- telescope
  --
  -- https://github.com/nvim-telescope/telescope.nvim
  -- https://github.com/nvim-telescope/telescope-media-files.nvim
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope
  },

  -- telescope-fzf-native.nvim
  --
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-fzf-nativenvim
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run   = "make"
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

  -- mason
  --
  -- https://github.com/williamboman/mason.nvim
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason
  }
}
