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

config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.5cell",
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
