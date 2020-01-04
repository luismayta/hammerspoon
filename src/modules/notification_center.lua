local pomodor = require('src.modules.pomodoor')
local hotkey = require('src.core.hotkey')
local logger = require("hs.logger")
local fn = require("src.core.functions")

local notification = {}

notification.icon = hs.image.imageFromPath('src/assets/notification-center.png'):setSize({ w = 20, h = 20 })

-- debugging
log = logger.new("notification", "debug")

notification.vars = {
  afterTime= 2,
  messageEnabled = {
      title        = 'Start Working with Not Disturb',
      subTitle     = 'Enabled',
      contentImage = notification.icon,
  },
  messageDisabled = {
      title        = 'Do Not Disturb',
      subTitle     = 'Disabled',
      contentImage = notification.icon,
  }
}

function notification.isEnabled()
  log:d("load is_enabled notification!")
  -- check if enabled
  local _, res = hs.applescript.applescript([[
    tell application "System Events"
      tell application process "SystemUIServer"
        tell (every menu bar whose title of menu bar item 1 contains "Notification")
          return title of (1st menu bar item whose title contains "Notification")
        end tell
      end tell
    end tell
  ]])

  local isEnabled = string.match(res[1], 'Do Not Disturb')
  return isEnabled
end

function notification.disable()
  fn.setStatusNotification("disable")
end

function notification.enable()
  fn.setStatusNotification("enable")
end

function notification.toggleDoNotDisturb()
  -- check if enabled
  local isEnabled = notification.isEnabled()
  local isPomododorEnabled = pomodor.isEnabled()

  if isPomododorEnabled == true then
    log:d("disabled working!")
    pomodor.disable()
    hs.notify.new(notification.vars.messageDisabled):send()
    fn.toggleDoNotDisturb()
  else
    log:d("active working!")
    pomodor.enable()
    hs.notify.new(notification.vars.messageEnabled):send()
    fn.toggleDoNotDisturb()
  end
end

function notification.init()
  hotkey.bindWithCtrlAlt(
      "w", "Toggle Work", notification.toggleDoNotDisturb
  )
end

notification.init()

return notification