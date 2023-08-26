-- luacheck: globals hs spoon
local logger = require("hs.logger")
local log = logger.new("Init")

log.df("Init hammerspoon")

-- luacheck: globals hs spoon
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.doiken = {
  url = "https://github.com/doiken/Spoons",
  desc = "doiken's spoon repository",
}

spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:updateAllRepos()

local speech = require("hs.speech")
-- Init speaker.
local speaker = speech.new()

log.df("start modules")
require("mod.default")
require("mod.widget")
require("mod.windows")
require("mod.wifi")
require("mod.hooks")
require("mod.apps")
require("mod.tools")
log.df("finished modules")

-- Speak something after configuration success.
speaker:speak(os.getenv("USER") .. ", I am online!")
