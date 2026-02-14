-- luacheck: globals hs
local stringUtil = require("core.utils.string")
local logger = require("core.logger").get("hotkey")

local Hotkey = {}
Hotkey.__index = Hotkey

local presets = {
  hyper = { "ctrl", "alt" },
  cmdHyper = { "cmd", "ctrl", "alt" },
  shiftHyper = { "shift", "cmd" },
}

function Hotkey.new(deps)
  local self = setmetatable({}, Hotkey)
  self.registered = {}
  self.functions = deps.functions

  logger.info("[Hotkey] Initialized Hotkey object")
  return self
end

function Hotkey:_format(mods, key)
  local info = ""
  for _, k in ipairs(mods) do
    info = info .. (info ~= "" and "+" or "") .. stringUtil.firstUp(k)
  end
  return info .. "+" .. stringUtil.firstUp(key)
end

function Hotkey:bind(mods, key, desc, fn)
  logger.info("[Hotkey] Attempting to bind key: %s with mods: %s", tostring(key), logger.inspect(mods))

  if not key or (type(key) ~= "string" and type(key) ~= "number") then
    logger.error("[Hotkey] Invalid key: %s (type %s)", tostring(key), type(key))
    return
  end

  if not self.registered then
    logger.warn("[Hotkey] self.registered is nil, initializing as empty table")
    self.registered = {}
  end

  if type(fn) ~= "function" then
    logger.error("[Hotkey] fn is not a function, got %s", type(fn))
    return
  end

  hs.hotkey.bind(mods, key, nil, fn)

  local info = self:_format(mods, key)
  table.insert(self.registered, {
    key = info,
    desc = desc,
  })

  logger.info("[Hotkey] Enabled hotkey %s -> %s", info, desc)
end

function Hotkey:bindPreset(preset, key, desc, fn)
  local mods = presets[preset]
  if not mods then
    logger.error("[Hotkey] Preset '%s' not found", preset)
    return
  end
  self:bind(mods, key, desc, fn)
end

function Hotkey:showRegistered()
  if not self.registered or #self.registered == 0 then
    logger.warn("[Hotkey] No registered hotkeys")
    return
  end

  local all = ""
  for _, v in ipairs(self.registered) do
    all = all .. "▶︎ (" .. v.key .. ") ☞ " .. v.desc .. "\n"
  end
  hs.dialog.blockAlert("Show Keys", all, "Close")
end

function Hotkey:setApps(apps)
  for _, value in ipairs(apps) do
    logger.info("[Hotkey] Processing app: %s, key: %s", tostring(value.name), tostring(value.key))
    if value.name and value.key then
      self:bindPreset("hyper", value.key, "Load " .. value.name, function()
        if self.functions and type(self.functions.toggleApplication) == "function" then
          self.functions.toggleApplication(value.name)
        else
          logger.error("[Hotkey] toggleApplication function is missing")
        end
      end)
    else
      logger.warn("[Hotkey] Skipping app due to missing name or key")
    end
  end
end

return Hotkey
