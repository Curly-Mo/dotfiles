local M = {}

M.pyenv_root = function()
  return vim.trim(vim.fn.system('pyenv root')) .. "/versions/"
end

M.pyenv_venv = function()
  return vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
end

M.set_pyenv_env_vars = function()
  vim.env.PYENV_VERSION = M.pyenv_venv()
  vim.env.PYENV_ROOT = M.pyenv_root()
end

M.pyenv_path = function()
  return vim.trim(vim.fn.system("pyenv which python"))
end

M.python_path = function()
  return M.pyenv_path() or "python"
end

return M
