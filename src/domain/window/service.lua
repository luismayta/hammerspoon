local M = {}

function M.toggleFullscreen(context)
  context.window.toggleFullscreen()
end

function M.moveRight(context)
  context.window.moveRight()
end

function M.moveLeft(context)
  context.window.moveLeft()
end

return M