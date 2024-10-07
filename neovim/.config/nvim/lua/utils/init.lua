local M = {}

-- merge tables
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

-- concat opts to default_opts
M.default_opts = function(default_opts)
  local function opts_with_defaults(opts)
    return M.concat(default_opts, opts or {})
  end
  return opts_with_defaults
end

-- call fallback_fn if fn returns an error
M.with_fallback = function(fn, fallback_fn)
  return function(opts)
    local result = fn(opts)
    if result then
      return result
    else
      return fallback_fn(opts)
    end
  end
end

return M
