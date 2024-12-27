-- treesitter
--
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- Required by spellsitter
      additional_vim_regex_highlighting = false,

      ensure_installed = {
        "awk",
        "bash",
        "c",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "hcl",
        "go",
        "gitattributes",
        "gitignore",
        "helm",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "ninja",
        "php",
        "python",
        "rust",
        "scss",
        "sql", -- Requires tree-sitter CLI (see https://github.com/tree-sitter/tree-sitter/releases)
        "toml",
        "typescript",
        "vim",
        "yaml",
      }
    }
  },
}
