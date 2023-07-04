local M = {}

M.custom = {
	n = {
		-- add to default key map, because the NVChad default is only loaded with the lsp
		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},

	-- ["gs"] = { "<Plug>(leap-from-window)" },
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Set Breakpoint" },
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Start current test method",
		},
	},
}

return M
