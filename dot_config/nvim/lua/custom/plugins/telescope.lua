return {

  -- telescope-emoji.nvim
  --
  -- https://github.com/xiyaowong/telescope-emoji.nvim
  {
    "xiyaowong/telescope-emoji.nvim",
  },

  -- telescope
  --
  -- https://github.com/nvim-telescope/telescope.nvim
  -- https://github.com/nvim-telescope/telescope-media-files.nvim
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".git/",
          ".mypy_cache/",
          ".venv/",
          "node_modules",
        },
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },

      extensions = {
        media_files = {
          find_cmd = "rg"
        }
      },

      extensions_list = {

        -- Default NvChad configuration from 'lua/plugins/configs/telescope.lua'
        "themes",
        "terms",

        -- Added extensions
        "emoji",
        "fzf",

      },

    }
  },

  -- telescope-fzf-native.nvim
  --
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-fzf-nativenvim
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
}
