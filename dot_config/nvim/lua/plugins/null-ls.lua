local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions

local mypy = lint.mypy.with({
  extra_args = function()
    local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
    return { "--python-executable", virtual .. "/bin/python3" }
  end,
})

local null_ls_sources = {
  -- general
  formatting.prettierd.with({ disabled_filetypes = { "python" } }),
  lint.fish,
  formatting.fish_indent,
  formatting.shfmt,
  -- lint.markdownlint_cli2.with({
  --   extra_args = { "--config", vim.fn.expand("~/.config/nvim/lua/plugins/.markdownlint-cli2.yaml") },
  -- }),

  -- python
  mypy,

  -- go
  formatting.goimports,
  formatting.gofumpt,
  ca.gomodifytags,
  ca.impl,
}

local mason = {
  "debugpy",
  -- go
  "goimports",
  "gofumpt",
  "gomodifytags",
  "impl",
  "delve",
  -- templ, html, htmx
  "html",
  "htmx",
  "tailwindcss",
}

return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = mason,
        automatic_installation = true,
        -- handlers = {}, -- do not auto set the mason plugins
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = {
      sources = null_ls_sources,
    },
  },
}
