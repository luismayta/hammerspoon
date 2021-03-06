-- luacheck: globals hs spoon
local config = require("core.config")
local logger = require("hs.logger")

-- debugging
local log = logger.new("tools", "debug")

hs.loadSpoon("SpoonInstall")
local Install=spoon.SpoonInstall

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
-- local countDown = hs.loadSpoon("CountDown")
-- hotkey.bindWithCtrlCmdAlt("t", "countdown",
--   function ()
--     hs.notify.new({title="Hammerspoon", informativeText="Starting Timer!"}):send()
--     countDown:startFor(config.countDown.minutes)
--   end
-- )
