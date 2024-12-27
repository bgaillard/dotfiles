-- lspconfig
--
-- https://github.com/neovim/nvim-lspconfig
-- https://nvchad.com/docs/config/lsp
return {
  "neovim/nvim-lspconfig",

  config = function()
    require "configs.lspconfig"
  end,

  opts = {
    settings = {
      lua = {
        diagnostics = {
          globals = { "require", "vim" }
        }
      }
    }
  }
}
