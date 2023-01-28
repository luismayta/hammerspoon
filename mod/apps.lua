local logger = require('hs.logger')
local hotkey = require('core.hotkey')
local config = require('core.config')
local log = logger.new("Apps")
log.df("apps %s", config.apps)

hotkey.setApps(config.apps)
hotkey.setDevs(config.devs)
-- hotkey.setMiscs(config.misc)

hotkey.bindWithCtrlAlt("`", "Load Open", function() os.execute( "open ~" ) end)