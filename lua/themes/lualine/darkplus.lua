-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit: Zoltan Dalmadi(lightline)
-- LuaFormatter off
local colors = {
    blue   = '#569cd6',
    green  = '#6a9955',
    purple = '#c586c0',
    red1   = '#d16969',
    yellow = '#dcdcaa',
    orange = '#ce9178',
    fg     = '#d4d4d4',
    -- bg     = '#00216c',
    bg     = '#007acc',
    -- bg     = '#68217a',
    -- bg     = '#252525',
    gray1  = '#5c6370',
    gray2  = '#2c323d',
    gray3  = '#3e4452',
}


return {
  normal = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  insert = {
      a = { fg = colors.fg, bg = colors.bg },
      b = { fg = colors.fg, bg = colors.bg },
      c = { fg = colors.fg, bg = colors.bg },
  },

  visual = {
      a = { fg = colors.fg, bg = colors.bg },
      b = { fg = colors.fg, bg = colors.bg },
      c = { fg = colors.fg, bg = colors.bg },
  },

  command = {
      a = { fg = colors.fg, bg = colors.bg },
      b = { fg = colors.fg, bg = colors.bg },
      c = { fg = colors.fg, bg = colors.bg },
  },

  replace = {
      a = { fg = colors.fg, bg = colors.bg },
      b = { fg = colors.fg, bg = colors.bg },
      c = { fg = colors.fg, bg = colors.bg },
  },

  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}
