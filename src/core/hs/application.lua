local M = {}

function M.toggle(bundleId)
  local app = hs.application.get(bundleId)

  if not app or app:isHidden() then
    hs.application.launchOrFocusByBundleID(bundleId)
    return
  end

  if hs.application.frontmostApplication() ~= app then
    app:activate()
  end
end

return M
