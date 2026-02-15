local M = {}

function M.toggleFullscreen()
  local win = hs.window.focusedWindow()
  if win then
    win:toggleFullScreen()
  end
end

function M.moveToNextScreen()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local screens = hs.screen.allScreens()
  if #screens < 2 then
    return
  end

  local current = win:screen()
  local nextScreen = current:next()

  if nextScreen then
    win:moveToScreen(nextScreen)
    win:centerOnScreen(nextScreen)
  end
end

return M
