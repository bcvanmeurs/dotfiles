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
  lint.shellcheck,
  formatting.prettierd.with({ disabled_filetypes = { "python" } }),

  -- python
  formatting.ruff,
  lint.ruff,
  formatting.black,
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
