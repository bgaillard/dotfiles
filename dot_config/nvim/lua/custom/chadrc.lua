local M = {}


M.plugins = {
  user = require "custom.plugins",

  override = {

    -- lspconfig
    --
    -- https://github.com/neovim/nvim-lspconfig
    ["neovim/nvim-lspconfig"] = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "require", "vim" },
          },
        }
      }
    },

    -- mason
    --
    -- https://github.com/williamboman/mason.nvim
    ["williamboman/mason.nvim"] = {
      ensure_installed = {

        -- DevOps / SRE
        "ansible-language-server",

        -- Docker
        "dockerfile-language-server",
        "hadolint",

        -- Go
        "delve",
        "go-debug-adapter",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "golangci-lint-langserver",
        "golines",
        "gomodifytags",
        "gopls",
        "gotests",
        "impl",
        "revive",
        "staticcheck",

        -- LaTex
        "ltex-ls",

        -- Java
        "clang-format",
        "jdtls",

        -- Javascript / Typescript
        "chrome-debug-adapter",
        "eslint-lsp",
        "eslint_d",
        "firefox-debug-adapter",
        "node-debug2-adapter",
        "quick-lint-js",
        "rome",
        "typescript-language-server",
        "xo",

        -- JSON
        "fixjson",
        "json-lsp",
        "json-to-struct",

        -- Lua
        "lua-language-server",
        "luacheck",
        "luaformatter",
        "stylua",

        -- Markdown / Text
        "alex",
        "grammarly-languageserver",
        "markdownlint",
        "marksman",
        "proselint",
        "prosemd-lsp",
        "remark-language-server",
        "vale",
        "write-good",

        -- Python
        "black",
        "debugpy",
        "flake8",
        "isort",
        "jedi-language-server",
        "mypy",
        "pylint",
        "python-lsp-server",
        "sourcery",

        -- Shell
        "awk-language-server",
        "bash-language-server",
        "shellcheck",
        "shellharden",
        "shfmt",

        -- SQL
        "sql-formatter",
        "sqlfluff",
        "sqlls",
        "sqls",

        -- Terraform
        "terraform-ls",
        "tflint",

        -- TOML
        "taplo",

        -- YAML
        "yaml-language-server",
        "yamllint",

        -- Web
        "css-lsp",
        "cssmodules-language-server",
        "djlint",
        "tailwindcss-language-server",
        "html-lsp",

        -- Others
        -- "diagnosticsls",
        "jq",
        -- "prettier",
        -- "prettierd",
        -- "stylelint_lsp",
        -- "vimls",

      }
    },

    -- nvim-tree
    --
    -- https://github.com/kyazdani42/nvim-tree.lua
    ["kyazdani42/nvim-tree.lua"] = {
      git = {
        enable = true,
      },
      renderer = {
        icons = {
          show = {
            git = true,
          }
        }
      }
    },

    -- telescope
    --
    -- https://github.com/nvim-telescope/telescope.nvim
    -- https://github.com/nvim-telescope/telescope-media-files.nvim
    ["nvim-telescope/telescope.nvim"] = {
      extensions = {
        media_files = {
          find_cmd = "rg"
        }
      },
      extensions_list = {
        "fzy_native",
        "themes",
        "terms"
      },
    },

    -- treesitter
    --
    -- https://github.com/nvim-treesitter/nvim-treesitter
    ["nvim-treesitter/nvim-treesitter"] = {

      -- Required by spellsitter
      additional_vim_regex_highlighting = false,

      ensure_installed = {
        "c",
        "cpp",
        "css",
        "dockerfile",
        "hcl",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "make",
        "ninja",
        "php",
        "python",
        "rust",
        "scss",
        "sql",
        "toml",
        "typescript",
        "vim",
        "yaml",
      }
    },

  }
}

M.ui = {
  theme = "gatekeeper",
  transparency = true
}

return M
