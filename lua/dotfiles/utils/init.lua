local M = {}

M.require = require("dotfiles.utils.require")

M.isInTable = function(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

M.mergeTables = function(t1, t2)
  local function deepMerge(target, source)
    for k, v in pairs(source) do
      if type(v) == "table" and type(target[k]) == "table" then
        deepMerge(target[k], v)
      else
        target[k] = v
      end
    end
  end
  deepMerge(t1, t2)
  return t1
end

return M
