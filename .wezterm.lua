local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Fira Code', { weight = 'Medium' })
config.font_size = 15
config.color_scheme = 'kanagawabones'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_padding = { left = '1cell', right = '1cell', top = '1cell', bottom = 0 }

return config
