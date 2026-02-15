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
  { mods = { "ctrl", "alt", "cmd" }, key = "b", app = "Bitwarden" },
  { mods = { "ctrl", "alt", "cmd" }, key = "e", app = "Vscodium" },
  { mods = { "ctrl", "alt", "cmd" }, key = "t", app = "Ghostty" },
  { mods = { "ctrl", "alt", "cmd" }, key = "n", app = "Notion" },
  { mods = { "ctrl", "alt", "cmd" }, key = "x", app = "XCode" },
  { mods = { "ctrl", "alt", "cmd" }, key = "i", app = "Insomnia" },
  { mods = { "ctrl", "alt", "cmd" }, key = "k", app = "Keybase" },
  { mods = { "ctrl", "alt", "cmd" }, key = "s", app = "Slack" },
  { mods = { "ctrl", "alt", "cmd" }, key = "j", app = "Jira" },
  { mods = { "ctrl", "alt", "cmd" }, key = "v", app = "Miro" },
  { mods = { "ctrl", "alt", "cmd" }, key = "z", app = "Zoom.us" },
  { mods = { "ctrl", "alt", "cmd" }, key = "o", app = "Obsidian" },

  { mods = { "ctrl", "alt" }, key = ",", app = "System Preferences" },
  { mods = { "ctrl", "alt" }, key = "3", app = "Launchpad" },
  { mods = { "ctrl", "alt" }, key = "d", app = "Discord" },
  { mods = { "ctrl", "alt" }, key = "f", app = "Figma" },
  { mods = { "ctrl", "alt" }, key = "e", app = "Spark" },
  { mods = { "ctrl", "alt" }, key = "a", app = "Airtable" },
  { mods = { "ctrl", "alt" }, key = "b", app = "Brave Browser" },
  { mods = { "ctrl", "alt" }, key = "c", app = "GoogleCalendar" },
  { mods = { "ctrl", "alt" }, key = "h", app = "WhatsApp" },
  { mods = { "ctrl", "alt" }, key = "t", app = "Telegram" },
  { mods = { "ctrl", "alt" }, key = "m", app = "Spotify" },
  { mods = { "ctrl", "alt" }, key = "r", app = "Reminders" },
  { mods = { "ctrl", "alt" }, key = "o", app = "Finder" },
}

-- config.apps = {
--   devs = {
--     { key = "t", name = "Ghostty" },
--     { key = "e", name = "Vscodium" },
--   },
--   apps = {
--     { key = "d", name = "Discord" },
--     { key = "b", name = "Brave Browser" },
--   },
--   misc = {
--     { key = "o", name = "Obsidian" },
--   },
-- }

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
