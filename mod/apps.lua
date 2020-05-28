require("src.core.extensions")

local hotkey = require('src.core.hotkey')
local config = require('src.core.config')

for _, value in ipairs(config.apps) do
    if value.name then
      hotkey.bindWithCtrlAlt(value.key, "Load", launchOrCycleFocus(value.name))
    end
end
hotkey.bindWithCtrlAlt("`", "Load Open", function() os.execute( "open ~" ) end )