-- luacheck: globals hs spoon

hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

local hotkey = require "core.hotkey"
local config = {
  DnsEmpty= "networksetup -setdnsservers Wi-Fi empty",
  DnsCloudflare= "networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4",
}

-- Displays
config.display = {
  display_laptop = 'Color LCD',
  display_external = 'ASUS PB238',
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
}

-- Implement settings for countdown
config.countDown = {
  minutes = 25 * 60
}

-- app environment keybindings. Bundle `id` is prefered, but application `name` will be ok using cmd + ctrl + alt.
config.devs = {
    {key = 'b', name = 'Bitwarden'},
    {key = 'e', name = 'Emacs'},
    {key = 't', name = 'Alacritty'},
    {key = 'n', name = 'Notion'},
    {key = 'x', name = 'XCode'},
    {key = 'i', name = 'Insomnia'},
    {key = 'k', name = 'Keybase'},
    {key = 's', name = 'Slack'},
    {key = 'j', name = 'Jira'},
    {key = 'v', name = 'Miro'},
    {key = 'z', name = 'Zoom.us'},
}

-- app environment keybindings. Bundle `id` is prefered, but application `name` will be ok using ctrl + alt.
config.apps = {
    {key = ',', name = 'System Preferences'},
    {key = '3', name = 'Launchpad'},
    {key = 'f', name = 'Figma'},
    {key = 'e', name = 'Spark'},
    {key = 'a', name = 'Airtable'},
    {key = 'b', name = 'Brave Browser'},
    {key = 'c', name = 'Calendar'},
    {key = 'h', name = 'WhatsApp'},
    {key = 'm', name = 'Spotify'},
    {key = 'r', name = 'Reminders'},
    {key = 'o', name = 'Finder'},
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
