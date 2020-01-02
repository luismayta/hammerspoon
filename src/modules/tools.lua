local hotkey = require("src.core.hotkey")

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall
Install:andUse(
  "ModalMgr",
  {
      loglevel = 'debug',
  }
)

Install:andUse("CountDown")

--
-- CountDown
--
hs.hotkey.bind(hotkey.cmdHyper, "T", function ()
  hs.notify.new({title="Hammerspoon", informativeText="Starting Timer!"}):send()
  spoon.CountDown:startFor(5)
end)

--
-- Caffeine
--
Install:andUse(
  "Caffeine", {
      start = true,
      hotkeys = {
        toggle = { hotkey.hyper, "1" }
      },
})


Install:andUse(
  "HeadphoneAutoPause",
  {
    start = true
  }
)

Install:andUse(
  "ReloadConfiguration",
  {
      start = true,
      hotkeys = {
        reloadConfiguration = { hotkey.hyper, "0" }
      },
  }
)