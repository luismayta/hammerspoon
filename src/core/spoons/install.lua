local M = {}

-- hs.loadSpoon("SpoonInstall")
local spoon_install = spoon.SpoonInstall

--- Install Spoons.
-- @name installSpoons
-- @param spoons list
-- @return null
function M.installSpoons(spoons)
  -- Load those Spoons
  for _, app in pairs(spoons) do
    if app.settings then
      spoon_install:andUse(app.name, app.settings)
    else
      spoon_install:andUse(app.name)
    end
  end
end

return M
