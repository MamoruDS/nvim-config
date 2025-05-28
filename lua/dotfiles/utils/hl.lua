local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl

local hl = {}

--- @alias HighlightGetter fun(name: string): vim.api.keyset.highlight
--- @alias HighlightSetter fun(name: string, opts: vim.api.keyset.highlight): nil

--- @type HighlightGetter
function hl.get(name)
  return get_hl(0, { link = false, name = name })
end

--- @type HighlightSetter
function hl.set(name, opts)
  set_hl(0, name, vim.tbl_deep_extend("force", hl.get(name), opts))
end

--- @alias dotfiles.utils.hl { get: HighlightGetter, set: HighlightSetter }
--- @return dotfiles.utils.hl
return hl
