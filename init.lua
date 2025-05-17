-- luacheck: globals hs spoon
package.path = hs.configdir .. "/src/?.lua;" ..
               hs.configdir .. "/src/?/init.lua;" ..
               package.path

local logger = require("hs.logger")
local log = logger.new("Init")
log.df("Starting Hammerspoon")

local success, speech = pcall(require, "hs.speech")
if not success then
    log.ef("Error in 'hs.speech': %s", speech)
    return
end

local speaker = speech.new()

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.doiken = {
    url = "https://github.com/doiken/Spoons",
    desc = "Spoons"
}
spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:updateAllRepos()

local config = require("core.config")

log.df("Load Modules Starting")
require("mod.default")(config)
require("mod.widget")(config)
require("mod.windows")(config)
require("mod.wifi")(config)
require("mod.hooks")(config)
require("mod.apps")(config)
require("mod.tools")(config)
require("mod.work")(config)
log.df("Load Modules Finished")

if speaker then
    speaker:speak(os.getenv("USER") .. ", ¡Happy Coding!")
end