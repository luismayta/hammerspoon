require("core.extensions")

local hotkey = require('core.hotkey')
local config = require('core.config')

for _, value in ipairs(config.apps) do
    if value.name then
      hotkey.bindWithCtrlAlt(value.key, "Load", launchOrCycleFocus(value.name))
    end
end
hotkey.bindWithCtrlAlt("`", "Load Open", function() os.execute( "open ~" ) end )