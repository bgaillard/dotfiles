-- auto-save
--
-- https://github.com/Pocco81/auto-save.nvim
return {
  -- see https://github.com/Pocco81/auto-save.nvim/issues/56
  --"Pocco81/auto-save.nvim",
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      enabled = true,
      callbacks = {
        before_saving = function()
          return vim.lsp.buf.format()
        end
      }
    }
  end,
  lazy = false
}
