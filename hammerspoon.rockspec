package = "hammerspoon"
version = "1.0.0"
source = {
  url = "git+ssh://git@github.com/luismayta/hammerspoon.git",
}
description = {
  summary = "Configuration for hammerspoon",
  detailed = [[
      This is an Configuration for hammerspoon.
  ]],
  homepage = "https://github.com/luismayta/hammerspoon",
  license = "LGPL-3.0",
}
dependencies = {
  "lua >= 5.1, < 5.4.6",
  -- If you depend on other rocks, add them here
}
build = {
  type = "builtin",
  modules = {
    ["Spoons.SpoonInstall.spoon.init"] = "Spoons/SpoonInstall.spoon/init.lua",
    ["core.config"] = "core/config.lua",
    ["core.fntools"] = "core/fntools.lua",
    ["core.functions"] = "core/functions.lua",
    ["core.hotkey"] = "core/hotkey.lua",
    ["core.strkit"] = "core/strkit.lua",
    init = "init.lua",
    ["mod.apps"] = "mod/apps.lua",
    ["mod.browser"] = "mod/browser.lua",
    ["mod.default"] = "mod/default.lua",
    ["mod.hooks"] = "mod/hooks.lua",
    ["mod.memory"] = "mod/memory.lua",
    ["mod.notification"] = "mod/notification.lua",
    ["mod.notification_center"] = "mod/notification_center.lua",
    ["mod.pomodoor"] = "mod/pomodoor.lua",
    ["mod.reload"] = "mod/reload.lua",
    ["mod.screens"] = "mod/screens.lua",
    ["mod.speed"] = "mod/speed.lua",
    ["mod.switcher"] = "mod/switcher.lua",
    ["mod.tools"] = "mod/tools.lua",
    ["mod.vim"] = "mod/vim.lua",
    ["mod.widget"] = "mod/widget.lua",
    ["mod.wifi"] = "mod/wifi.lua",
    ["mod.windows"] = "mod/windows.lua",
  },
  copy_directories = {
    "docs",
  },
}