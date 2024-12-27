 -- copilot
 --
 -- https://github.com/github/copilot.vim
 return {
   "github/copilot.vim",
   lazy = false,
   config = function()
     -- Mapping tab is already used by NvChad
     vim.g.copilot_no_tab_map = true;
     vim.g.copilot_assume_mapped = true;
     vim.g.copilot_tab_fallback = "";
   end,
 }
