-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

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
  "ts_ls",

  -- JSON
  "jsonls",

  -- LaTex
  -- FIXME: Temporary disabled because it covers GIT gutter signs in README.md files
  --"ltex",
  --"texlab",

  -- Lua
  --"sumneko_lua",

  -- Markdown
  "marksman",

  -- Python
  "basedpyright",
  "ruff",

  -- SQL
  "sqlls",

  -- Terraform
  --"terraform_lsp",
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

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Specific "ltex" setup
--
-- see https://valentjn.github.io/ltex/index.html
lspconfig.ltex.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  -- Default file types configured are documented at the bellow link.
  --
  -- see https://valentjn.github.io/ltex/supported-languages.html#markup-languages
  --
  -- You can enter the following command to get a list of all file types known by Neovim
  --
  --     :echo getcompletion('', 'filetype')
  --
  filetypes = {
    "tex"
  },
  settings = {
    ltex = {
      dictionary = {
        ["en-US"] = {
          "Javascript",
          "Python",
          "SLI",
          "SLIs"
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

lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      keyOrdering = false,
    }
  }
}
