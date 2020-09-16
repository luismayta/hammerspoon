local hotkey = require("core.hotkey")
local config = require("core.config")
local logger = require("hs.logger")

local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

vim
   :disableForApp('VSCodium')
   :disableForApp('zoom.us')
   :disableForApp('iTerm')
   :disableForApp('Alacritty')
   :disableForApp('Terminal')
   :shouldDimScreenInNormalMode(true)
   :enterWithSequence('jk')
   :bindHotKeys({ enter = {{'ctrl'}, ';'} })

return vim
