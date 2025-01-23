-- Apply all Ruff fixecs, inspired by:
-- https://github.com/astral-sh/ruff-lsp/issues/409#issuecomment-2069037437
-- and
-- https://github.com/search?q=repo:LazyVim/LazyVim%20snacks_toggle&type=code

-- Function to apply Ruff fixes
local function apply_ruff_fixes(force)
  if not force and not vim.g.autoformat then
    return
  end

  vim.lsp.buf.code_action({
    ---@diagnostic disable-next-line: missing-fields
    context = {
      ---@diagnostic disable-next-line: assign-type-mismatch
      only = { "source.fixAll.ruff" },
    },
    apply = true,
  })
end

-- Create an autocommand group for buffer-specific events
local group = vim.api.nvim_create_augroup("RuffAutoCmd", { clear = true })

-- Autocommand for applying Ruff fixes on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  buffer = 0,
  callback = function()
    apply_ruff_fixes(false) -- Use `force = false` for autoformat checks
  end,
})

-- User command to manually trigger Ruff fixes
vim.api.nvim_buf_create_user_command(0, "Ruff", function()
  apply_ruff_fixes(true) -- Use `force = true` to bypass `vim.g.autoformat`
end, { desc = "Apply Ruff fixes" })
