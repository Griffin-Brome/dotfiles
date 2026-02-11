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
config.enable_wayland = false

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

function distrobox_list()
  local distrobox_list = {}
  local success, stdout, stderr = wezterm.run_child_process {
    'distrobox',
    'ls',
    '--no-color',
  }
  for i, line in ipairs(wezterm.split_by_newlines(stdout)) do
    if i > 1 then
      local id, name, status, image = line:match '(.-)%s+|%s+(.-)%s+|%s+(.-)%s+|%s+(.-)'
      if id and name then
        distrobox_list[id] = {
          id = id,
          name = name,
          status = status,
          image = image
        }
      end
    end
  end
  return distrobox_list
end

function make_distrobox_fixup_func(name)
  return function(cmd)
    local wrapped = {
      'distrobox',
      'enter',
      '--name',
      name,
    }
    if cmd.args then
      table.insert(wrapped, '--')
      for _, arg in ipairs(cmd.args) do
          table.insert(wrapped, arg)
      end
    end

    cmd.args = wrapped
    return cmd
  end
end

function compute_exec_domains()
  local exec_domains = {}
  for _, distrobox in pairs(distrobox_list()) do
    table.insert(
      exec_domains,
      wezterm.exec_domain(
        'distrobox:' .. distrobox.name,
        make_distrobox_fixup_func(distrobox.name),
        distrobox.image
      )
    )
  end
  return exec_domains
end

config.exec_domains = compute_exec_domains()


-- and finally, return the configuration to wezterm
return config
