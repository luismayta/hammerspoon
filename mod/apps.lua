local hotkey = require('core.hotkey')
local config = require('core.config')

hotkey.setApps(config.apps)
hotkey.setDevs(config.devs)
hotkey.setMiscs(config.misc)

hotkey.bindWithCtrlAlt("`", "Load Open", function() os.execute( "open ~" ) end)