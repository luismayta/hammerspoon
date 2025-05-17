-- luacheck: globals hs spoon
local logger = require("hs.logger")
local Install
local hooks = {}

function hooks.notifyUsb(x)
    hs.notify.new({title = x}):send()
    hs.notify.new({title = 'Hammerspoon Reloaded'}):send()
end

function hooks.notifyBluetooth(x)
    hs.notify.new({title = x}):send()
    hs.notify.new({title = 'Bluetooth Device Connected'}):send()
end

local function init(_)
    local log = logger.new("Apps")

    local success, spoonInstall = pcall(require, "SpoonInstall")
    if not success then
        log.ef("Error to load SpoonInstall: %s", spoonInstall)
        return nil
    end

    Install = spoonInstall

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

    Install:andUse(
        "BluetoothDeviceActions",
        {
            config = {
                devices = {
                    AirPods = { fn = hooks.notifyBluetooth },
                }
            },
            start = true
        }
    )

    log.df("SpoonInstall Load Success")

    return hooks
end

return init