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
for _, spoon in pairs(config.spoons) do
  if not spoon:get("settings") then
    Install:andUse(spoon.name)
  end
  Install:andUse(spoon.name, spoon.settings)
end

--
-- CountDown
--
hs.hotkey.bind(hotkey.cmdHyper, "T", function ()
  hs.notify.new({title="Hammerspoon", informativeText="Starting Timer!"}):send()
  spoon.CountDown:startFor(config.countdown.minutes * 60)
end)