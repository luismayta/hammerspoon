local M = {}

function M.goLeft()
  local switcher = hs.window.switcher.new()
  switcher:previous()
end

function M.goRight()
  local switcher = hs.window.switcher.new()
  switcher:next()
end

function M.toggleFullscreen()
  local win = hs.window.focusedWindow()
  if win then
    win:toggleFullScreen()
  end
end

function M.moveRight()
  local win = hs.window.focusedWindow()
  if win then
    win:moveOneScreenEast()
  end
end

function M.moveLeft()
  local win = hs.window.focusedWindow()
  if win then
    win:moveOneScreenWest()
  end
end

return M