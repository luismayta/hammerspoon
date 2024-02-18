-- luacheck: globals hs spoon
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
    desc = "Repositorio de cucharas de doiken",
}
spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:updateAllRepos()

log.df("Load Modules Starting")
require("mod.default")
require("mod.widget")
require("mod.windows")
require("mod.wifi")
require("mod.hooks")
require("mod.apps")
require("mod.tools")
log.df("Load Modules Finished")

if speaker then
    speaker:speak(os.getenv("USER") .. ", ¡Happy Coding!")
end