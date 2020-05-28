require("src.core.fntools")
local settings = require('src.core.config')
hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall

local hooks = {

}

-- USBDeviceActions, opens/closes apps or runs an arbitrary function when a USB device is connected/disconnected
-- https://github.com/malob/USBDeviceActions.spoon
function hooks.notifyUsb(x)
  hs.notify.new({title=x}):send()
  hs.notify.new({title='Hammerspoon Reloaded'}):send()
end

Install:andUse(
  "USBDeviceActions",
  {
    config = {
      devices = {
        MrRobot = { fn = hooks.notifyUsb },
      }
    },
    start = true
  }
)

return hooks