-- luacheck: globals hs spoon

local logger = require("hs.logger")
local hotkey = require("core.hotkey")

local function init(_)
  local log = logger.new("Apps")

  -- Load SpoonInstall
  log.df("SpoonInstall Starting")
  local success, spoonInstall = pcall(require, "SpoonInstall")
  if not success then
      log.ef("Error: in load SpoonInstall")
      return
  end

  if not hotkey or not hotkey.setApps then
      log.ef("Error: Module 'hotkey' no load")
      return
  end

  local Install = spoonInstall

  Install:andUse("Cherry", {
    start = false,
    hotkeys = {
      bindHotkeys = { hotkey.cmdHyper, "c" },
    },
    notification = hs.notify.new({ title = "Done! 🍒", withdrawAfter = 5}),
    duration = 5,
    alertDuration = 5,

  })

  log.df("SpoonInstall Load Success")

end

return init