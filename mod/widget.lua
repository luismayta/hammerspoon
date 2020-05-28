local hotkey = require("src.core.hotkey")

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall
Install:andUse(
  "ModalMgr",
  {
      loglevel = 'debug',
  }
)