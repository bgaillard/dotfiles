 -- null-ls
 --
 -- https://github.com/jose-elias-alvarez/null-ls.nvim
local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- Python
  -- null_ls.builtins.formatting.pylint,

  -- Shell
  b.formatting.shfmt,
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Terraform
  b.formatting.terraform_fmt
}

null_ls.setup {
   debug = false,
   sources = sources,
}
