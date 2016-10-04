hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
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
  {"Google Chrome",  nil,          screenName, hs.layout.maximized,    nil, nil},
  {"Slack",   nil,          screenName, hs.layout.maximized,   nil, nil},
  {"iTerm2",   nil,          screenName, hs.layout.maximized,   nil, nil},
  {"Atom",   nil,          screenName, hs.layout.maximized,   nil, nil},
}
local bigWindowLayout = {
  {"Google Chrome",  nil,          screenName, {x=0, y=0, w=0.6, h=1},    nil, nil},
  {"Slack",   nil,          screenName, {x=0.6, y=0, w=0.4, h=1},   nil, nil},
  {"iTerm2",   nil,          screenName, {x=0, y=0, w=0.6, h=1},   nil, nil},
  {"Atom",   nil,          screenName, {x=0, y=0, w=0.6, h=1},   nil, nil},
}
if screenName == "Color LCD" then
  hs.layout.apply(laptopWindowLayout)
elseif screenName == "Thunderbolt Display" then
  hs.layout.apply(bigWindowLayout)
end
