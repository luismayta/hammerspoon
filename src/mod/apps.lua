local logger = require("hs.logger")
local hotkey = require("core.hotkey")

local function init(config)
  local log = logger.new("Apps")

  log.df("Configuration of Application: %s", config.apps)

  if not hotkey or not hotkey.setApps then
      log.ef("Error: Module 'hotkey' no load")
      return
  end

  if not config or not config.apps then
      log.ef("Error: Module 'config' no load")
      return
  end

  hotkey.setApps(config.apps)
  hotkey.setDevs(config.devs)
  hotkey.setMiscs(config.misc)

  hotkey.bindWithCtrlAlt("`", "Load Open", function()
    os.execute("open ~")
  end)

end

return init
