 -- nvim-tree
 --
 -- A File Explorer for Neovim written in Lua
 --
 -- https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
   opts = {

     -- Disable netrw at the very start of your init.lua (strongly advised)
     --
     -- see https://github.com/nvim-tree/nvim-tree.lua
     disable_netrw = false,

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
       width = 40
     }
   },
}
