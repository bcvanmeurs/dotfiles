return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = { "dmypy" },
      },
      linters = {
        ["markdownlint-cli2"] = {
          -- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217

          args = {
            "--config",
            vim.fn.stdpath("config") .. "/lua/plugins/.markdownlint-cli2.yaml",
            "--",
          },
        },
      },
    },
  },
}
