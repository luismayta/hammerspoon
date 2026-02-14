return {
  profiles = {
    developer = {
      mainScreen = {
        "company.thebrowser.Browser",
      },
      secondScreen = {
        "com.mitchellh.ghostty",
        "com.brave.Browser",
        "com.hnc.Discord",
        "md.obsidian",
      },
    },

    speaker = {
      mainScreen = {
        "com.apple.Keynote",
        "com.apple.Notes",
      },
      secondScreen = {
        "com.brave.Browser",
      },
    },
  },

  hotkeys = {
    switchProfile = { { "ctrl", "alt", "cmd" }, "w" },
  },
}
