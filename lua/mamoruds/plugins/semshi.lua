-- vim.g.python3_host_prog =

vim.cmd([[
    hi semshiImported None
    hi semshiGlobal None
    hi semshiBuiltin None
    hi semshiSelected None
    hi semshiSelf None
    hi semshiParameter None
    hi semshiParameterUnused None
    hi semshiAttribute None

    hi link semshiImported @constructor
    hi link semshiGlobal @constant
    hi link semshiBuiltin @function
    hi link semshiSelf Normal
    hi link semshiParameter @constructor
    hi link semshiParameterUnused @constructor
    hi link semshiAttribute @attribute
]])

vim.g["semshi#excluded_hl_groups"] = {
  "local",
  "unresolved",
  -- "attribute",
  -- "builtin",
  "free",
  "global", -- not working
  -- "parameter",
  -- "parameterUnused",
  -- "self",
  -- "imported",
}
