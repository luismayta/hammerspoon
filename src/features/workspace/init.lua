local service = require("domain.workspace.service")

local M = {}

function M.setup(context)
  local config = context.config.workspace
  if not config then
    return
  end

  if config.hotkeys and config.hotkeys.switchProfile then
    local hk = config.hotkeys.switchProfile

    context.hotkey:bind(hk.mods, hk.key, hk.desc, function()
      service.switchProfile(context, "developer")
    end)
  end
end

return M
