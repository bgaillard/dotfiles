-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {

  -- Ansible
  "ansiblels",

  -- Compilation
  "cmake",
  "gradle_ls",

  -- Docker
  "dockerls",

  -- Go
  "golangci_lint_ls",
  "gopls",

  -- Shell
  "awk_ls",
  "bashls",

  -- Java
  "java_language_server",
  "jdtls",

  -- Javascript / Typescript
  "eslint",
  "quick_lint_js",
  "tsserver",

  -- JSON
  "jsonls",

  -- LaTex
  "ltex",
  "texlab",

  -- Lua
  "sumneko_lua",

  -- Markdown
  "marksman",

  -- Python
  "jedi_language_server", -- pip install --user python-language-server
  "pylsp",                -- pip install --user python-lsp-server
  "pyre",                 -- sudo apt install watchman
  "pyright",              -- pip install --user pyright

  -- SQL
  "sqlls",
  "sqls",

  -- Terraform
  "terraform_lsp",
  "terraformls",
  "tflint",

  -- TOML
  "taplo",

  -- Web
  "cssls",
  "cssmodules_ls",
  "tailwindcss",
  "html",

  -- YAML
  "yamlls",

  -- Others
  "diagnosticls",
  "vimls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end