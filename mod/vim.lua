-- luacheck: globals hs spoon
local hotkey = require('core.hotkey')
local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

vim
   :shouldDimScreenInNormalMode(true)
   :enterWithSequence('jk')
   :bindHotKeys({ enter = {hotkey.cmdHyper, ';'} })

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)
