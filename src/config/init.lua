local M = {}

M.global = require("config.global")
M.workspace = require("config.workspace")

M.features = {
  workspace = true,
  applications = true,
  window = true,
}

return M