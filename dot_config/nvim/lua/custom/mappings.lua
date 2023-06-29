local M = {}
M.custom = {
	-- add to default key map, because the NVChad default is only loaded with the lsp
	n = {
		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},
}
return M
