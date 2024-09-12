local M = {}

local Path = require("plenary.path")


M.relative_path = function(original_path, reference_path, root_path)
	-- Use plenary's make relative to clean paths
	local orig_path = Path:new(original_path)
	local path = Path:new(orig_path:make_relative(reference_path))
	local ref_path = Path:new(reference_path)
	-- local ref_rel_path = Path:new(ref_path:make_relative(reference_path))
	local parents = path:parents()
	local ref_parents = ref_path:parents()

	local path_elements = vim.split(path.filename, "/")
	table.insert(parents, 1, original_path)
	table.insert(ref_parents, 1, reference_path)

	local result = ""
	for i, ref_parent in ipairs(ref_parents) do
		for j, par in ipairs(parents) do
			if ref_parent == par then
				if i == 1 and j == 1 then
					return ""
				end

				result = result .. table.concat(path_elements, "/", #path_elements - j + 2)
				return result
			end
		end

		result = "../" .. result
    if (string.find(result, "../../../") and root_path ~= nil) then
      print(root_path)
      return ":GROOT/" .. orig_path:make_relative(root_path)
    end
	end
end

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree_cache = {}
M.is_inside_work_tree = function(path)
  if path == nil then path = vim.fn.getcwd() end
  if is_inside_work_tree_cache[path] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree_cache[path] = vim.v.shell_error == 0
  end
  return is_inside_work_tree_cache[path]
end

local groot_cache = {}
M.groot = function(path, fallback)
  if path == nil then path = vim.fn.getcwd() end
  if fallback == nil then fallback = path end
  local groot = fallback
  if groot_cache[path] == nil then
    if M.is_inside_work_tree(path) then
      local root = string.gsub(vim.fn.system("git -C " .. path .. " rev-parse --show-toplevel"), "\n", "")
      if vim.v.shell_error == 0 then
        groot = root
      end
    end
    groot_cache[path] = groot
  end
  return groot_cache[path]
end

return M
