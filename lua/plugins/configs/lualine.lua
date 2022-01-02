if not pcall(require, "lualine") then
    return
end

local colors = require("themes.lualine.darkplus")

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
    padding = { left = 0, right = 0 },
}

local filename = {
    'filename',
    file_status = false,
    path = 0,
    shorting_target = 40
}

local modified = {
    function()
        if vim.bo.modified then
            return '[+]'
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
            return '[-]'
        end
        return ''
    end
}

local diff = {
	'diff',
	colored = false,
    -- symbols = { added = " ", modified = "柳", removed = " " },
    symbols = { added = " ", modified = " ", removed = " " },
}

local diagnostics = {
    'diagnostics',
    sections = {'error', 'warn'},
    symbols = { error = " ", warn = " ", info = " ", hint = " " },

    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local fileformat = {
    'fileformat',
    symbols = {
        -- unix = ' ',
        -- dos = ' ',
        -- mac = ' ',
        unix = 'UNIX',
        dos = 'DOS',
        mac = 'MAC',
    },
    -- padding = { left = 0, right = 1 },
}

local filetype = {
    "filetype",
    icons_enabled = false,
    icons = nil,
}

local spaces = {
    function()
        return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
}

local spell = {
    function()
        if vim.api.nvim_win_get_option(0, "spell") then
            return "spell"
        end
        return ""
    end,
    icon = "✓",
}

local lsp_clients = {
   function()
       local msg = "" 
       local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
       local clients = vim.lsp.get_active_clients()
       if next(clients) == nil then
           return msg
       end
       for _, client in ipairs(clients) do
           local filetypes = client.config.filetypes
           if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
               return client.name
           end
       end
       return msg
   end,
   icon = " ",
   icons_enabled = false,
}

local location = {
    "location",
    padding = { left = 0, right = 2 },
}

local progress = {
    function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    color = { fg = colors.yellow, bg = colors.bg },
    cond = nil,
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = colors,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
    always_divide_middle = true,
  },

  sections = {
    lualine_a = {"branch", diagnostics},
    lualine_b = {mode},
    lualine_c = {},
    lualine_x = {diff, spaces, "encoding", spell, filetype},
    lualine_y = {location},
    lualine_z = {progress}
  },

  inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-tree" },
}
