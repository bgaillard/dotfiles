local M = {}

M.telescope = {
  extensions = {
    media_files = {
      find_cmd = "rg"
    }
  },

  extensions_list = {

    -- Default NvChad configuration from 'lua/plugins/configs/telescope.lua'
    "themes",
    "terms",

    -- Added extensions
    "emoji",
    "fzf",

  },
}

M.lspconfig = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "require", "vim" },
      },
    }
  }
}

M.mason = {
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
}

M.nvimtree = {
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
}


M.treesitter = {

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
}

return M
