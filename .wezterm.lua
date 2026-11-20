local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'powershell.exe','-NoLogo'}
config.font = wezterm.font 'JetBrains Mono'
config.audible_bell =  "Disabled"
config.enable_kitty_graphics = true
config.hide_tab_bar_if_only_one_tab = true

return config
