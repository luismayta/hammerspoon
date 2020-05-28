local hotkey = require('src.core.hotkey')
hotkey.bindWithCtrlAlt(
  '0', 'Reloaded',
  function()
    hs.reload()
    hs.notify.new({title='Hammerspoon Reloaded'}):send()
  end
)