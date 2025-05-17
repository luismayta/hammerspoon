-- luacheck: globals hs spoon
local logger = require("hs.logger")

local obj = {}

-- debugging
local log = logger.new("functions", "debug")

-- hs.loadSpoon("SpoonInstall")
local spoon_install = spoon.SpoonInstall

---------------------------------------------
-- OS X isDoNotDisturbEnabled
---------------------------------------------
function obj.isDoNotDisturbEnabled()
  local command = "defaults -currentHost read com.apple.notificationcenterui doNotDisturb"

  local mode, _, _, _ = hs.execute(command)

  return tonumber(mode) == 1
end

---------------------------------------------
-- OS X Toggle Status Notification
---------------------------------------------
function obj.toggleDoNotDisturb()
  local _, status, type, rc = hs.execute("do-not-disturb toggle", true)

  if not (status == true and type == "exit" and rc == 0) then
    hs.alert("Whoops! Toggling 'Do Not Disturb' failed.")

    local alertDurationInSeconds = 4
    hs.alert(
      "Make sure you have sindresorhus/do-not-disturb-cli installed and try again.",
      hs.alert.defaultStyle,
      hs.screen.mainScreen(),
      alertDurationInSeconds
    )
  end
end

---------------------------------------------
-- OS X Notification SetStatusNotification
---------------------------------------------
function obj.setStatusNotification(status)
  local script = "do-not-disturb off"
  if status == "enable" then
    script = "do-not-disturb on"
  end

  local _, _, _, code = hs.execute(script, true)
  log:d(code)
  return status
end

---------------------------------------------
-- OS X Notification Clear
---------------------------------------------
function obj.clearNotifications()
  local script = [[
    my closeNotif()
    on closeNotif()
        tell application "System Events"
            tell process "Notification Center"
                set theWindows to every window
                repeat with i from 1 to number of items in theWindows
                    set this_item to item i of theWindows
                    try
                        click button 1 of this_item
                    on error
                        my closeNotif()
                    end try
                end repeat
            end tell
        end tell
    end closeNotif
  ]]

  local response, err = pcall(hs.applescript.applescript(script))
  if err == true then
    log:d(err)
    error(err)
  end
  return response
end

function obj.toggleApplication(name)
  return function()
    local app = hs.application.find(name)
    if not app or app:isHidden() then
      hs.application.launchOrFocus(name)
    elseif hs.application.frontmostApplication() ~= app then
      app:activate()
    end
  end
end

function obj.goLeft()
  local switcher = hs.window.switcher.new()
  switcher:previous()
end

function obj.goRight()
  local switcher = hs.window.switcher.new()
  switcher:next()
end

--- Reconfigure volume.
-- @name reconfigVolume
-- @param volume number
-- @return null
function obj.reconfigVolume(volume)
  hs.audiodevice.defaultOutputDevice():setVolume(volume)
end

--- Install Spoons.
-- @name installSpoons
-- @param spoons list
-- @return null
function obj.installSpoons(spoons)
  -- Load those Spoons
  for _, app in pairs(spoons) do
    if app.settings then
      spoon_install:andUse(app.name, app.settings)
    else
      spoon_install:andUse(app.name)
    end
  end
end

return obj