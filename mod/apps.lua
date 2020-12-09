local extension = require("core.extensions")
local hotkey = require('core.hotkey')
local config = require('core.config')

for _, value in ipairs(config.apps) do
    if value.name then
      hotkey.bindWithCtrlAlt(value.key, "Load", extension.launchOrCycleFocus(value.name))
    end
end
for _, value in ipairs(config.devs) do
    if value.name then
      hotkey.bindWithCtrlCmdAlt(value.key, "Load", extension.launchOrCycleFocus(value.name))
    end
end
hotkey.bindWithCtrlAlt("`", "Load Open", function() os.execute( "open ~" ) end )
