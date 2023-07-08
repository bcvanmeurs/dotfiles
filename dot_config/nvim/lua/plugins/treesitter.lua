return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- defaults
      "vim",
      "lua",
      "fish",
      "bash",

      -- web dev
      "html",
      "css",
      "javascript",
      "typescript",
      "json",
      "yaml",
      -- "vue",
      -- "svelte",

      -- programming
      "python",
      "rust",

      -- text files
      "toml",
      "markdown",
      "markdown_inline",
    },
  },
}
