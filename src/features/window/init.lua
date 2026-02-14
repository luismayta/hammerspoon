local service = require("domain.window.service")

local M = {}

function M.setup(context)
  context.hotkey.bindWithAlt("m", "Toggle Full Screen", function()
    service.toggleFullscreen(context)
  end)

  context.hotkey.bindWithAlt("l", "Move to right", function()
    service.moveRight(context)
  end)

  context.hotkey.bindWithAlt("h", "Move to left", function()
    service.moveLeft(context)
  end)
end

return M
