local M = {}

-- Deep merge of two tables (t2 overrides t1)
function M.deepMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" and type(t1[k]) == "table" then
      M.deepMerge(t1[k], v)
    else
      t1[k] = v
    end
  end
  return t1
end

-- Merges localConfig over globalConfig, deeply
function M.mergeWith(localConfig, globalConfig)
  local result = {}

  -- Copy global config
  for k, v in pairs(globalConfig or {}) do
    if type(v) == "table" then
      result[k] = M.deepMerge({}, v)
    else
      result[k] = v
    end
  end

  -- Deep merge local config over result
  return M.deepMerge(result, localConfig or {})
end

return M
