local M = {}

M.concat = function(...)
  local args = {...}
  local result = {}
  for _, arg in ipairs(args) do
    for key, val in pairs(arg) do
      result[key] = val
    end
  end
  return result
end

M.merged = M.concat

M.default_opts = function(default_opts)
  local function opts_with_defaults(opts)
    return M.concat(default_opts, opts or {})
  end
  return opts_with_defaults
end

return M
