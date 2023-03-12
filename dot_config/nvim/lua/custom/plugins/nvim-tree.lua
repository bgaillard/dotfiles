 -- nvim-tree
 --
 -- https://github.com/kyazdani42/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    git = {
      enable = true,
    },
    renderer = {
      icons = {
        show = {
          git = true,
        }
      }
    }
  },
}
