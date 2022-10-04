hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
hs.loadSpoon('Hyper')                 -- https://github.com/evantravers/Hyper.spoon

local toggle_bluetooth = [[tell application "System Preferences"
    reveal pane id "com.apple.preferences.Bluetooth"
    -- activate

    set the current pane to pane id "com.apple.preferences.Bluetooth"

    try
        tell application "System Events" to tell process "System Preferences"
            click button "Turn Bluetooth Off" of window "Bluetooth"
        end tell

        delay 1

    on error
        tell application "System Events" to tell process "System Preferences"
            click button "Turn Bluetooth On" of window "Bluetooth"
        end tell

    end try
    quit

end tell]]

Config = {}
Config.applications = require('configApplications')

Hyper = spoon.Hyper
             :start(Config)
             :setHyperKey('F19')

-- Jump to zoom
Hyper:bind({}, 'z', nil, function()
  hs.application.launchOrFocusByBundleID('com.obsproject.obs-studio')
  hs.application.launchOrFocusByBundleID('us.zoom.xos')
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("🤘 Config loaded 🤘")

-- toggle bluetooth and wifi for when I'm connected to the monitor
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  hs.osascript.applescript(toggle_bluetooth)

  local wifi_state = hs.wifi.interfaceDetails().power
  if wifi_state then
    hs.wifi.setPower(false)
  else
    hs.wifi.setPower(true)
  end
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)
local screenName = hs.screen.allScreens()[1]:name()
local laptopWindowLayout = {
  {"Google Chrome",  nil, screenName, hs.layout.maximized, nil, nil},
  {"Slack",          nil, screenName, hs.layout.maximized, nil, nil},
  {"iTerm2",         nil, screenName, hs.layout.maximized, nil, nil},
  {"Atom",           nil, screenName, hs.layout.maximized, nil, nil},
}
local bigWindowLayout = {
  {"Google Chrome",  nil, screenName, {x=0,   y=0, w=0.6, h=1}, nil, nil},
  {"Slack",          nil, screenName, {x=0.6, y=0, w=0.4, h=1}, nil, nil},
  {"iTerm2",         nil, screenName, {x=0,   y=0, w=1,   h=1}, nil, nil},
  {"Atom",           nil, screenName, {x=0,   y=0, w=0.6, h=1}, nil, nil},
}
if screenName == "Built-in Retina Display" then
  hs.layout.apply(laptopWindowLayout)
elseif screenName == "Thunderbolt Display" then
  hs.layout.apply(bigWindowLayout)
end
