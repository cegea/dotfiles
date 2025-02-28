-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { 'powershell.exe' }

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-frappe'

-- Tabline
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()

-- and finally, return the configuration to wezterm
return config

