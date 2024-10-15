-- TODO: replace with phlebotinum plugin
local M = {}

local colors = {
  dark_bg  = '#080808',
  light_bg = 'NONE',
  fg       = '#bcbcbc',
  grey     = '#6c6c6c',
  orange   = '#ffba7b',
  teal     = '#5f8787',
  blue     = '#5f5f87',
  red      = '#703020',
}

M.status_colors = {
  saved = colors.grey,
  modified = colors.orange,
}

M.lualine_theme = {
  normal = {
    a = {bg = colors.dark_bg, fg = colors.fg, gui = 'bold'},
    b = {bg = colors.light_bg, fg = colors.fg},
    c = {bg = colors.dark_bg, fg = colors.grey}
  },
  insert = {
    a = {bg = colors.blue, fg = colors.dark_bg, gui = 'bold'},
    b = {bg = colors.light_bg, fg = colors.fg},
    c = {bg = colors.grey, fg = colors.dark_bg}
  },
  visual = {
    a = {bg = colors.red, fg = colors.fg, gui = 'bold'},
    b = {bg = colors.light_bg, fg = colors.fg},
    c = {bg = colors.grey, fg = colors.dark_bg}
  },
  replace = {
    a = {bg = colors.light_bg, fg = colors.red, gui = 'bold'},
    b = {bg = colors.light_bg, fg = colors.fg},
    c = {bg = colors.grey, fg = colors.dark_bg}
  },
  command = {
    a = {bg = colors.dark_bg, fg = colors.fg, gui = 'bold'},
    b = {bg = colors.light_bg, fg = colors.fg},
    c = {bg = colors.dark_bg, fg = colors.grey}
  },
  inactive = {
    a = {bg = colors.dark_bg, fg = colors.grey, gui = 'bold'},
    b = {bg = colors.dark_bg, fg = colors.grey},
    c = {bg = colors.dark_bg, fg = colors.grey}
  },
}

return M
