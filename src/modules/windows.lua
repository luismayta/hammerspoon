-- require("src.core.extensions")
local hotkey = require("src.core.hotkey")
local window = require("hs.window")

hotkey.bindWithAlt(
  'm', 'Toggle Full Screen', function ()
    window.focusedWindow():toggleFullScreen()
  end
)
-- hs.hotkey.bind(hyper, "D", screenToRight)
-- hs.hotkey.bind(hyper, "A", screenToLeft)