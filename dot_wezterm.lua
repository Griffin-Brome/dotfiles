-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- If on MacOS, treat both left & right OPTION as ALT
-- ref: https://wezfurlong.org/wezterm/config/keyboard-concepts.html?h=composed#macos-left-and-right-option-key
if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.send_composed_key_when_right_alt_is_pressed = false
  config.window_close_confirmation = 'NeverPrompt'
end

config.audible_bell = "Disabled"
config.enable_kitty_keyboard = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Send ESC using ^[
  {
    key = '[',
    mods = 'CTRL',
    action = wezterm.action.SendString '\x1b' ,
  },
  { key = ' ', mods = 'LEADER', action = wezterm.action.QuickSelect },
  
}

-- and finally, return the configuration to wezterm
return config
