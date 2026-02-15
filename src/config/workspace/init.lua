local config = {}

config.profiles = {
  developer = {
    mainScreen = { "Arc" },
    secondScreen = { "Ghostty", "Brave Browser", "Discord", "Obsidian" },
  },
  research = {
    mainScreen = { "Arc" },
    secondScreen = { "Ghostty", "Brave Browser", "Discord", "Obsidian" },
  },
  speaker = {
    mainScreen = { "Keynote", "Notes", "Arc", "Obsidian", "Ghostty" },
    secondScreen = { "Brave Browser", "Discord" },
  },
}

config.hotkeys = {
  switchProfile = {
    mods = { "ctrl", "alt", "cmd" },
    key = "w",
    desc = "Switch workspace profile",
  },
}

config.apps = {
  { mods = { "ctrl", "alt", "cmd" }, key = "[", app = "Android Studio" },
  { mods = { "ctrl", "alt", "cmd" }, key = "]", app = "IntelliJ IDEA CE" },
  { mods = { "ctrl", "alt", "cmd" }, key = ";", app = "Zed" },
  { mods = { "ctrl", "alt", "cmd" }, key = "b", app = "Bitwarden" },
  { mods = { "ctrl", "alt", "cmd" }, key = "d", app = "draw.io" },
  { mods = { "ctrl", "alt", "cmd" }, key = "t", app = "Ghostty" },
  { mods = { "ctrl", "alt", "cmd" }, key = "x", app = "XCode" },
  { mods = { "ctrl", "alt", "cmd" }, key = "i", app = "Insomnia" },
  { mods = { "ctrl", "alt", "cmd" }, key = "q", app = "DBeaver" },
  { mods = { "ctrl", "alt", "cmd" }, key = "k", app = "Keybase" },
  { mods = { "ctrl", "alt", "cmd" }, key = "j", app = "Jira" },
  { mods = { "ctrl", "alt", "cmd" }, key = "m", app = "Miro" },
  { mods = { "ctrl", "alt", "cmd" }, key = "o", app = "Obsidian" },
  { mods = { "ctrl", "alt", "cmd" }, key = "z", app = "Zoom.us" },

  { mods = { "ctrl", "alt" }, key = ",", app = "System Preferences" },
  { mods = { "ctrl", "alt" }, key = "3", app = "Launchpad" },
  { mods = { "ctrl", "alt" }, key = "d", app = "Discord" },
  { mods = { "ctrl", "alt" }, key = "f", app = "Figma" },
  { mods = { "ctrl", "alt" }, key = "e", app = "Spark" },
  { mods = { "ctrl", "alt" }, key = "a", app = "Arc" },
  { mods = { "ctrl", "alt" }, key = "b", app = "Brave Browser" },
  { mods = { "ctrl", "alt" }, key = "c", app = "Calendar" },
  { mods = { "ctrl", "alt" }, key = "h", app = "WhatsApp" },
  { mods = { "ctrl", "alt" }, key = "t", app = "Telegram" },
  { mods = { "ctrl", "alt" }, key = "m", app = "Music" },
  { mods = { "ctrl", "alt" }, key = "r", app = "Reminders" },
  { mods = { "ctrl", "alt" }, key = "o", app = "Finder" },
  { mods = { "ctrl", "alt" }, key = "s", app = "Stocks" },

  { mods = { "shift", "cmd" }, key = "b", app = "Binance" },
}

config.spoons = {
  {
    name = "Cherry",
    settings = {
      start = false,
      hotkeys = {
        bindHotkeys = { { "ctrl", "alt", "cmd" }, "c" },
      },
    },
  },
}

return config
