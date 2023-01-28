-- luacheck: globals hs spoon
local config = require("core.config")
local logger = require("hs.logger")
local fn = require("core.functions")

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

fn.installSpoons(config.spoons)