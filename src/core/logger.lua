local logger = require("hs.logger")

local M = {}

local level = "info"

function M.setLevel(lvl)
  level = lvl
end

function M.get(name)
  local log = logger.new(name)
  log.setLogLevel(level)
  return log
end

return M
