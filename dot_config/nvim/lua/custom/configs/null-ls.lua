local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier.with({ disabled_filetypes = { "python" } }),
	formatting.stylua,

	-- python
	formatting.ruff,
	lint.ruff,

	formatting.black,

	lint.mypy.with({
		extra_args = function()
			local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
			return { "--python-executable", virtual .. "/bin/python3" }
		end,
	}),

	lint.shellcheck,
}

-- autoformat on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client_1, bufnr)
		if client_1.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({
						async = false,
						filter = function(client_2)
							return client_2.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
