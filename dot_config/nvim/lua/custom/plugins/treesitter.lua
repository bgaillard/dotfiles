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
