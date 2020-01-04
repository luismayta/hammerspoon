local hotkey = require("src.core.hotkey")
local config = require("src.core.config")

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall

Install:andUse(
  "ModalMgr",
  {
    loglevel = 'debug',
  }
)

-- Load those Spoons
for _, app in pairs(config.spoons) do
  if app.settings then
    Install:andUse(app.name, app.settings)
  else
    Install:andUse(app.name)
  end
end

--
-- CountDown
--
hs.hotkey.bind(hotkey.cmdHyper, "T", function ()
  hs.notify.new({title="Hammerspoon", informativeText="Starting Timer!"}):send()
  spoon.CountDown:startFor(config.countdown.minutes * 60)
end)