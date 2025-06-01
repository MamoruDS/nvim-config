local M = {}

M.require = require("dotfiles.utils.require")

M.executable = function(name)
  if vim.fn.executable(name) > 0 then
    return true
  end
  return false
end

---@generic T1: table
---@generic T2: table
---@param t1 T1
---@param t2 T2
---@return T1|T2
M.merge_tables = function(t1, t2)
  return vim.tbl_deep_extend("force", t1, t2)
end

M.table_has = function(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

return M
