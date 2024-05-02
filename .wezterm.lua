-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This table will hold the configuration.
local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 25500
-- This is where you actually apply your config choices
config.color_scheme = 'Tokyo Night Storm'
config.enable_scroll_bar = true
-- config.colors = { scrollbar_thumb = '#ffffff' }
config.audible_bell = 'Disabled'
-- and finally, return the configuration to wezterm
config.term = 'wezterm'

config.initial_rows = 500
config.initial_cols = 500
config.keys = {
  {
    key = 'r',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- This will create a new split and run your default program inside it
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Next'
  },
}

-- for i = 1, 8 do
--   table.insert(config.keys {
--     key = tostring(i),
--     mods = 'CRTL|SHIFT',
--     action = wezterm.action.ActivateTab(i),
--   })
-- end
--
return config
