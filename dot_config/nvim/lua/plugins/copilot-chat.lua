 -- CopilotChat.nvim
 --
 -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
 return {
   "CopilotC-Nvim/CopilotChat.nvim",
   lazy = false,
   dependencies = {
     {"github/copilot.vim"},
     {"nvim-telescope/telescope.nvim", branch = "master"},
   },
   build = "make tiktoken",
   opts = {},
 }
