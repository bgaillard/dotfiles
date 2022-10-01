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
  "jedi_language_server",
  "pylsp",
  "pyre",
  "pyright",

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

  -- Specific "ltex" setup
  if lsp == "ltex" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ltex = {
          dictionary = {
            ["en-US"] = {
              "Javascript", "Python",
              "SLI", "SLIs"
            }
          },
          latex = {
            commands = {
              ["\\setbeamercolor{}{}"] = "ignore",
              ["\\setbeamertemplate{}"] = "ignore",
              ["\\thesection"] = "ignore",
              ["\\thesubsection"] = "ignore",
              ["\\usefonttheme{}"] = "ignore",
              ["\\usetheme{}"] = "ignore"
            }
          }
        }
      }
    }

  -- Generic setup
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

end
