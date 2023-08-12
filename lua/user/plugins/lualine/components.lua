local colors = require("user.plugins.lualine.styles")

return {
    mode = {
        "mode",
        fmt = function(str)
            return "-- " .. str .. " --"
        end,
        padding = { left = 0, right = 0 },
    },

    filename = {
        'filename',
        file_status = false,
        path = 0,
        shorting_target = 40
    },

    branch = {
        "branch",
        icons_enabled = true,
        icon = icons.git.Branch,
    },

    modified = {
        function()
            if vim.bo.modified then
                return '[+]'
            elseif vim.bo.modifiable == false or vim.bo.readonly == true then
                return '[-]'
            end
            return ''
        end
    },

    diff = {
        'diff',
        colored = false,
        symbols = {
            added = icons.git.LineAdded .. " ",
            modified = icons.git.LineModified .. " ",
            removed = icons.git.LineModified .. " ",
        },
    },

    diagnostics = {
        'diagnostics',
        sections = {'error', 'warn'},
        symbols = {
            error = icons.diagnostics.Error .. " ",
            warn = icons.diagnostics.Warning .. " ",
            info = icons.diagnostics.Information .. " ",
            hint = icons.diagnostics.Hint .. " ",
        },
        colored = false,
        update_in_insert = false,
        always_visible = true,
    },

    fileformat = {
        'fileformat',
        symbols = {
            -- unix = ' ',
            -- dos = ' ',
            -- mac = ' ',
            unix = 'LF',
            dos = 'CRLF',
            mac = 'LF',
        },
        -- padding = { left = 0, right = 1 },
    },

    filetype = {
        "filetype",
        icons_enabled = true,
        icons = nil,
    },
    
    encoding = {
        "encoding",
        fmt = function(str)
            return string.upper(str)
        end,
        padding = { left = 1, right = 1 },
    },

    spaces = {
        function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end
    },

    spell = {
        function()
            if vim.api.nvim_win_get_option(0, "spell") then
                return icons.ui.Check .. " spell"
            end
            return icons.diagnostics.Warning .. " spell off"
        end,
    },

    lsp_clients = {
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
    },

    location = {
        "location",
        fmt = function()
            local row, column = unpack(vim.api.nvim_win_get_cursor(0))
            return "Ln " .. row .. ", Col " .. column + 1
        end,
        padding = { left = 1, right = 1 },
    },

    progress = {
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
    },
}
