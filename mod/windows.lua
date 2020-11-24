local hotkey = require("core.hotkey")
local window = require("hs.window")

hotkey.bindWithAlt(
  'm', 'Toggle Full Screen', function ()
    window.focusedWindow():toggleFullScreen()
  end
)

-- move screen
hotkey.bindWithAlt(
  'l', 'Move to right', function ()
    window.focusedWindow():toggleFullScreen()
  end
)

-- hs.hotkey.bind(hyper, "D", screenToRight)
-- hs.hotkey.bind(hyper, "A", screenToLeft)