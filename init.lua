hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.doiken = {
  url = "https://github.com/doiken/Spoons",
  desc = "doiken's spoon repository",
}
local speech = require 'hs.speech'
-- Init speaker.
speaker = speech.new()
require('src.mod.default')
require('src.mod.memory')
require('src.mod.speed')
require('src.mod.widget')
require('src.mod.windows')
require('src.mod.switcher')
require('src.mod.notification_center')
require('src.mod.wifi')
require('src.mod.hooks')
require('src.mod.browser')
require('src.mod.apps')
require('src.mod.tools')

-- Speak something after configuration success.
speaker:speak(os.getenv("USER") .. ", I am online!")