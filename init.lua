hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.doiken = {
  url = "https://github.com/doiken/Spoons",
  desc = "doiken's spoon repository",
}
require('src.modules.default')
require('src.modules.memory')
require('src.modules.speed')
require('src.modules.widget')
require('src.modules.tools')
require('src.modules.windows')
require('src.modules.switcher')
require('src.modules.notification_center')
require('src.modules.wifi')
require('src.modules.hooks')
require('src.modules.browser')
require('src.modules.apps')