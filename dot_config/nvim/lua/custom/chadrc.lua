---@type ChadrcConfig
local M = {}
M.ui = { theme = "catppuccin", hl_override = {
	CursorLine = {
		bg = "#383747",
	},
} }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
