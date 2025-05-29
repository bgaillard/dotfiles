-- mason
--
-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
--
-- https://github.com/williamboman/mason.nvim
return  {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        automatic_installation = true,

        -- IMPORTANT
        --   - The plugins listed below MUST BE available in the Mason '(2) LSP' tab or the table accessible through the 
        --     bellow link.
        --   - Install only essential and best plugins and no more! Otherwise you'll end with a slow setup with is more
        --     prone to plugin installation errors.
        --
        -- @see https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        ensure_installed = {
          -- DevOps / SRE
          -- "ansiblels",
          -- "awk_ls",

          -- -- Docker
          "docker_compose_language_service",
          "dockerls",

          --"dockerfile-language-server",
          -- "hadolint",

          -- Several languages
          -- "ast_grep",
          -- "harper_ls",

          -- Go
          -- "golangci_lint_ls",
          "gopls",
          "templ",

          -- "delve",
          -- "go-debug-adapter",
          -- "gofumpt",
          -- "goimports",
          -- "golangci-lint",
          -- "golangci-lint-langserver",
          -- "golines",
          -- "gomodifytags",
          -- "gopls",
          -- "gotests",
          -- "impl",
          -- "revive",
          -- "staticcheck",

          -- LaTex
          "ltex",
          "texlab",
          "textlsp",
          --"ltex-ls",

          -- -- Java
          -- "clang-format",
          -- "jdtls",
          --
          -- -- Javascript / Typescript
          -- --"chrome-debug-adapter",
          -- "eslint-lsp",
          -- "eslint_d",
          -- --"firefox-debug-adapter",
          -- "node-debug2-adapter",
          -- "quick-lint-js",
          -- "rome",
          -- "typescript-language-server",
          -- "xo",
          --
          -- -- JSON
          -- "fixjson",
          -- "json-lsp",
          -- "json-to-struct",
          --
          -- -- Lua
          -- "lua-language-server",
          -- "luacheck",
          -- "luaformatter",
          -- "stylua",

          -- -- Markdown / Text
          -- "alex",
          -- "grammarly-languageserver",
          -- "markdownlint",
          -- "marksman",
          -- "proselint",
          -- "prosemd-lsp",
          -- "remark-language-server",
          -- "vale",
          -- "write-good",

          -- Python
          "basedpyright",
          "ruff",

          -- Shell
          "bashls",

          -- -- SQL
          -- "sql-formatter",
          -- "sqlfluff",
          -- "sqlls",
          --
          -- Terraform
          "terraformls",
          "tflint",

          -- -- TOML
          -- "taplo",

          -- YAML
          "yamlls",

          -- -- Web
          -- "css-lsp",
          -- "cssmodules-language-server",
          -- "djlint",
          -- "tailwindcss-language-server",
          -- "html-lsp",
          --
          -- -- Others
          -- -- "diagnosticsls",
          -- -- "jq",
          -- -- "prettier",
          -- -- "prettierd",
          -- -- "stylelint_lsp",
          -- -- "vimls",

        }
      })
    end
  }
}
