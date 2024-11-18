-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14
config.color_scheme = "Tokyo Night Moon"

-- Make right alt keyw work as expected
config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = true

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = 0,
}

-- Spawn a fish shell in login mode
config.default_prog = { "/run/current-system/sw/bin/tmux" }
-- config.default_prog = { '/opt/homebrew/bin/tmux', 'new-session', '-A', '-s main' }

config.skip_close_confirmation_for_processes_named = {
	"tmux",
	"nvim",
	"vim",
	"fish",
	"bash",
	"sh",
	"/run/current-system/sw/bin/tmux",
}

-- and finally, return the configuration to wezterm
return config
