local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl

local hl = {}

function hl.get(name)
  return get_hl(0, { link = false, name = name })
end

function hl.set(name, opts)
  set_hl(0, name, vim.tbl_deep_extend("force", hl.get(name), opts))
end

return hl
