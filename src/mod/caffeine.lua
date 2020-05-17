local mod = {}

mod.namespace = "caffeine"

local caffeineState = false
local screenWatcher = nil
local menubar = nil

local function setMenuIcon()
  if hs.caffeinate.get("displayIdle") then
    menubar:setIcon(mod.context.resources .. "caffeineIconActive.tiff")
  else
    menubar:setIcon(mod.context.resources .. "caffeineIcon.tiff")
  end
end

local function screenWatcherListener()
  local monitorCount = #hs.screen.allScreens()

  if (monitorCount > 1) then
    hs.caffeinate.set("displayIdle", true, true)
  else
    if (caffeineState) then
      hs.caffeinate.set("displayIdle", true, true)
    else
      hs.caffeinate.set("displayIdle", false, true)
    end
  end

  setMenuIcon()
end

function mod.lockScreen()
  hs.caffeinate.lockScreen()
end

function mod.systemSleep()
  hs.caffeinate.systemSleep()
end

function mod.startScreensaver()
  hs.caffeinate.startScreensaver()
end

function mod.sleepLockSystem()
  hs.caffeinate.lockScreen()
  hs.timer.doAfter(5, hs.caffeinate.systemSleep())
end

function mod.caffeineMenuOnClick()
  local monitorCount = #hs.screen.allScreens()

  if hs.caffeinate.get("displayIdle") then
    hs.caffeinate.set("displayIdle", false, true)

    if (monitorCount == 1) then
      caffeineState = false
    end
  else
    hs.caffeinate.set("displayIdle", true, true)

    if (monitorCount == 1) then
      caffeineState = true
    end
  end

  setMenuIcon()
end

function mod.init()
  menubar = hs.menubar.new()

  if menubar then
    menubar:setClickCallback(mod.caffeineMenuOnClick)
    setMenuIcon()
  end

  if mod.context.config.monitorMode then
    screenWatcher = hs.screen.watcher.new(screenWatcherListener)

    if screenWatcher then
      screenWatcher:start()
    end
  end
end

function mod.unload()
  menubar:delete()
  menubar = nil
end

return mod
