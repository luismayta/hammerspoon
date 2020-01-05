local hotkey = require("src.core.hotkey")
config = {
  DnsEmpty= "networksetup -setdnsservers Wi-Fi empty",
  DnsCloudflare= "networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1",
}

-- Displays
config.display = {
  display_laptop = 'Color LCD',
  display_external = 'ASUS PB238'
}

-- Browsers
config.browser = {
  brave = 'com.brave.Browser',
  canary = 'com.google.Chrome.canary',
  chrome = 'com.google.Chrome',
  firefox = 'org.mozilla.firefox',
  firefoxDev = 'org.mozilla.firefoxdeveloperedition',
  safari = 'com.apple.Safari',
}

-- Specify Spoons which will be loaded
config.spoons = {
  {
    name="ModalMgr",
    settings={
      loglevel = 'debug',
    }
  },
  {
    name="WindowGrid",
    settings={
      config = { gridGeometries = { { "6x4" } } },
      hotkeys = {show_grid = {hotkey.hyper, ","}},
      start = true,
    }
  },
  {
    name="WindowHalfsAndThirds",
    settings={
      config = {
        use_frame_correctness = true
      },
      hotkeys = 'default'
    }
  },
  {
    name="WindowScreenLeftAndRight",
    settings={
      hotkeys = 'default'
    }
  },
  {
    name="Caffeine",
    settings ={
      start = true,
      hotkeys = {
        toggle = { hotkey.hyper, "1" }
      },
    }
  },
  {
    name="HeadphoneAutoPause",
    settings ={
      start = true,
    }
  },
  {
    name="ReloadConfiguration",
    settings ={
      start = true,
      hotkeys = {
        reloadConfiguration = { hotkey.hyper, "0" }
      },
    }
  },
  {
    name="CountDown"
  },
  {
    name="FnMate"
  },
  {
    name="WinWin"
  },
}

-- Implement settings for countdown
config.countDown = {
  minutes = 25 * 60
}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
config.apps = {
    {key = 'a', name = 'Atom'},
    {key = 'b', name = 'Brave Browser'},
    {key = 'c', name = 'Calendar'},
    {key = 'e', name = 'Visual Studio Code'},
    {key = 'f', name = 'Figma'},
    {key = 'd', name = 'Dash'},
    {key = 't', name = 'Alacritty'},
    {key = 'm', name = 'Spotify'},
    {key = 'n', name = 'Notion'},
    {key = 'x', name = 'XCode'},
    {key = 'i', name = 'Insomnia'},
    {key = 'k', name = 'Keybase'},
    {key = 'o', name = 'Finder'},
    {key = 'r', name = 'Reminders'},
    {key = 's', name = 'Slack'},
    {key = 'v', name = 'ActivityMonitor'},
    {key = 'y', name = 'systempreferences'},
}

-- -----
-- Utils
-- -----
function config.split(sep)
  local sep, fields = sep or ':', {}
  local pattern = string.format('([^%s]+)', sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

config.DefaultBrowser = config.browser.brave
config.devBrowser = config.browser.brave
config.personalBrowser = config.browser.brave
config.hangoutsBrowser = config.browser.chrome

return config