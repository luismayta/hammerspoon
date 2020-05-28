hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.doiken = {
  url = "https://github.com/doiken/Spoons",
  desc = "doiken's spoon repository",
}
local speech = require 'hs.speech'
-- Init speaker.
speaker = speech.new()
require('mod.default')
require('mod.memory')
require('mod.speed')
require('mod.widget')
require('mod.windows')
require('mod.switcher')
require('mod.notification_center')
require('mod.wifi')
require('mod.hooks')
require('mod.browser')
require('mod.apps')
require('mod.tools')

-- Speak something after configuration success.
speaker:speak(os.getenv("USER") .. ", I am online!")