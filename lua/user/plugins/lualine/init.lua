local ok, lualine = pcall(require, "lualine")

if not ok then
    return
end

local theme = require("user.plugins.lualine.styles")
local components = require("user.plugins.lualine.components")

lualine.setup {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
        always_divide_middle = true,
    },

    sections = {
        lualine_a = {
            components.branch,
            components.diagnostics,
            components.lsp_clients,
        },
        lualine_b = { components.mode },
        lualine_c = {},
        lualine_x = {
            components.diff,
            components.spaces,
            components.encoding,
            components.fileformat,
            components.filetype,
        },
        lualine_y = { "location" },
        lualine_z = { components.progress }
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
