local ok, navic = pcall(require, "nvim-navic")

if not ok then
    return
end

navic.setup{
    icons = {
        Array = icons.kind.Array .. " ",
        Boolean = icons.kind.Boolean,
        Class = icons.kind.Class .. " ",
        Color = icons.kind.Color .. " ",
        Constant = icons.kind.Constant .. " ",
        Constructor = icons.kind.Constructor .. " ",
        Enum = icons.kind.Enum .. " ",
        EnumMember = icons.kind.EnumMember .. " ",
        Event = icons.kind.Event .. " ",
        Field = icons.kind.Field .. " ",
        File = icons.kind.File .. " ",
        Folder = icons.kind.Folder .. " ",
        Function = icons.kind.Function .. " ",
        Interface = icons.kind.Interface .. " ",
        Key = icons.kind.Key .. " ",
        Keyword = icons.kind.Keyword .. " ",
        Method = icons.kind.Method .. " ",
        Module = icons.kind.Module .. " ",
        Namespace = icons.kind.Namespace .. " ",
        Null = icons.kind.Null .. " ",
        Number = icons.kind.Number .. " ",
        Object = icons.kind.Object .. " ",
        Operator = icons.kind.Operator .. " ",
        Package = icons.kind.Package .. " ",
        Property = icons.kind.Property .. " ",
        Reference = icons.kind.Reference .. " ",
        Snippet = icons.kind.Snippet .. " ",
        String = icons.kind.String .. " ",
        Struct = icons.kind.Struct .. " ",
        Text = icons.kind.Text .. " ",
        TypeParameter = icons.kind.TypeParameter .. " ",
        Unit = icons.kind.Unit .. " ",
        Value = icons.kind.Value .. " ",
        Variable = icons.kind.Variable .. " ",
    },
    highlight = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
}

local M = {}

M.winbar_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "Jaq",
    "harpoon",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dap-repl",
    "dap-terminal",
    "dapui_console",
    "lab",
    "Markdown",
    "",
}

M.get_path = function()
    local dir = string.match(vim.fn.expand "%:p", ".*/([^/]+)/")
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local f = require "user.core.utils"


    if not f.isempty(filename) then
        local file_icon, file_icon_color =
        require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

        local hl_group = "FileIconColor" .. extension

        vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
        if f.isempty(file_icon) then
            file_icon = icons.ui.File
            file_icon_color = ""
        end

        local navic_text = vim.api.nvim_get_hl_by_name("NavicText", true)
        vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

        -- return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"

        return " " .. "%#Winbar#" .. dir .. " " .. icons.ui.ChevronRight .. " " .. "%*"
            .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " "
            .. "%#Winbar#" .. filename .. "%*"
    end
end

M.modified = function()
    if vim.bo.modified then
        return " " .. icons.ui.Circle
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return " " .. icons.ui.Lock
    end
    return ""
end

local get_gps = function()
    local status_gps_ok, gps = pcall(require, "nvim-navic")
    if not status_gps_ok then
        return ""
    end

    local status_ok, gps_location = pcall(gps.get_location, {})
    if not status_ok then
        return ""
    end

    if not gps.is_available() or gps_location == "error" then
        return ""
    end

    if not require("user.core.utils").isempty(gps_location) then
        return icons.ui.ChevronRight .. " " .. gps_location
    else
        return ""
    end
end

local excludes = function()
    if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt.winbar = ""
        return true
    end
    return false
end

M.get_winbar = function()
    if excludes() then
        return
    end
    local f = require "user.core.utils"
    local value = M.get_path()
    local modified = M.modified()

    local gps_added = false
    if not f.isempty(value) then
        local gps_value = get_gps()
        value = value .. " " .. gps_value .. " " .. modified
        if not f.isempty(gps_value) then
            gps_added = true
        end
    end

    if not f.isempty(value) and f.get_buf_option "mod" then
        if gps_added then
            value = value .. " "
        else
            value = value
        end
    end

    local num_tabs = #vim.api.nvim_list_tabpages()

    if num_tabs > 1 and not f.isempty(value) then
        local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
        value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
    end

    local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
    if not status_ok then
        return
    end
end

M.create_winbar = function()
    vim.api.nvim_create_augroup("_winbar", {})
    if vim.fn.has "nvim-0.8" == 1 then
        vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
            {
                group = "_winbar",
                callback = function()
                    local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
                    if not status_ok then
                        require("user.plugins.nvim-navic").get_winbar()
                    end
                end,
            }
        )
    end
end

M.create_winbar()

return M
