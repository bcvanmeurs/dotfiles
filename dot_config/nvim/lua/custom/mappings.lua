local M = {}

M.custom = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- add to default key map, because the NVChad default is only loaded with the lsp
		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},

	-- ["gs"] = { "<Plug>(leap-from-window)" },
	-- colemak remappings
	-- 	["n"] = { "j", "move down" },
	-- 	["e"] = { "k", "move up" },
	-- 	["m"] = { "h", "move left" },
	-- 	["i"] = { "l", "move right" },
	--
	-- 	["j"] = { "m", "mark/set" },
	-- 	["k"] = { "n", "next" },
	-- 	["K"] = { "N", "previous" },
	-- 	["h"] = { "i", "insert" },
	-- 	["l"] = { "e", "end" },
	-- },
	--
	-- v = {
	-- 	["n"] = { "j", "move down" },
	-- 	["e"] = { "k", "move up" },
	-- 	["m"] = { "h", "move left" },
	-- 	["i"] = { "l", "move right" },
	--
	-- 	["j"] = { "m", "mark/set" },
	-- 	["k"] = { "n", "next" },
	-- 	["K"] = { "N", "previous" },
	-- 	["h"] = { "i", "insert" },
	-- 	["l"] = { "e", "end" },
	-- },
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
