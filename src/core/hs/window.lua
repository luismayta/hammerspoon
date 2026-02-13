local M = {}

function M.goLeft()
  local switcher = hs.window.switcher.new()
  switcher:previous()
end

function M.goRight()
  local switcher = hs.window.switcher.new()
  switcher:next()
end

return M
