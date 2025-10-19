-- null-ls
--
-- https://github.com/jose-elias-alvarez/null-ls.nvim
return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
       "neovim/nvim-lspconfig",
    },
    config = function()
      local present, null_ls = pcall(require, "null-ls")

      if not present then
         return
     end

      local sources = {

         -- Python
         -- null_ls.builtins.formatting.pylint,

         -- Shell
         -- b.formatting.shfmt,
         -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
      }

      null_ls.setup {
         debug = true,
         sources = sources,
      }
    end,
  },
}
