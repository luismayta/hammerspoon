local M = {}

function M.togglen(name)
  return function()
    local app = hs.application.find(name)
    if not app or app:isHidden() then
      hs.application.launchOrFocus(name)
    elseif hs.application.frontmostApplication() ~= app then
      app:activate()
    end
  end
end

return M
