hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.doiken = {
  url = "https://github.com/doiken/Spoons",
  desc = "doiken's spoon repository",
}
local speech = require 'hs.speech'
-- Init speaker.
speaker = speech.new()
require('src.modules.default')
require('src.modules.memory')
require('src.modules.speed')
require('src.modules.widget')
require('src.modules.windows')
require('src.modules.switcher')
require('src.modules.notification_center')
require('src.modules.wifi')
require('src.modules.hooks')
require('src.modules.browser')
require('src.modules.apps')
require('src.modules.tools')

-- Speak something after configuration success.
speaker:speak(os.getenv("USER") .. ", I am online!")