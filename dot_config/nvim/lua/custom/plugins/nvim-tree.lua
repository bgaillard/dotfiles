 -- nvim-tree
 --
 -- https://github.com/kyazdani42/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    git = {
      enable = true,
      ignore = false
    },
    renderer = {
      icons = {
        show = {
          git = true,
        }
      }
    },
    view = {
       width = 60
     }
  },
}
