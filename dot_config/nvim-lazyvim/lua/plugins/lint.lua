return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function()
      local linters_by_ft = {}

      -- Check if mypy is installed before using dmypy
      if vim.fn.executable("mypy") == 1 then
        linters_by_ft.python = { "dmypy" }
      else
        linters_by_ft.python = {} -- No linter or add an alternative
      end

      return {
        linters_by_ft = linters_by_ft,
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
      }
    end,
  },
}
