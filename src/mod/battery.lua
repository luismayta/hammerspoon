local mod = {}

mod.namespace = 'batterypanel'
mod.dependencies = {'std'}

local batteryMenu = nil
local refreshTimer = nil
local batteryWatcher = nil
local remainingTime = -2

local function enableMenubar()
  if (mod.context.config.enableMenubar and batteryMenu == nil) then
    batteryMenu = hs.menubar:new()
  end
end

local function disableMenubar()
  if (mod.context.config.enableMenubar and batteryMenu ~= nil) then
    batteryMenu:delete()
    batteryMenu = nil
  end
end

local function setTitle()
  if (remainingTime < 0) then
    disableMenubar()
  else
    enableMenubar()
    batteryMenu:setTitle(string.format(mod.context.config.batteryText, ahf.lib.std.system.toTime(remainingTime).string))
  end
end

local function refreshRemainingTime()
  remainingTime = hs.battery.timeRemaining()

  if mod.context.config.enableMenubar then
    setTitle()
  end
end

function mod.showRemainingTime()
  if (remainingTime == -2) then
    hs.alert.show(mod.context.config.powerSupplyText)
  elseif (remainingTime == -1) then
    hs.alert.show(mod.context.config.calculatingText)
  else
    hs.alert.show(string.format(mod.context.config.batteryText, ahf.lib.std.system.toTime(remainingTime).string))
  end
end

function mod.init()
  refreshRemainingTime()

  batteryWatcher = hs.battery.watcher.new(refreshRemainingTime)
  batteryWatcher:start()
end

function mod.unload()
  disableMenubar()
  batteryWatcher:stop()
  batteryWatcher = nil
end

return mod
