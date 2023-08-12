local M = {}
function M.isempty(s)
    return s == nil or s == ""
end

function M.get_buf_option(opt)
    local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
    if not status_ok then
        return nil
    else
        return buf_option
    end
end


vim.api.nvim_create_user_command(
    "BufferKill", 
    function()
        require("user.plugins.bufferline.buf_kill") "bd"
    end,
    { force = true }
)

function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    -- local line_count = vim.v.foldend - vim.v.foldstart + 1
    
    return icons.ui.ChevronShortRight .. " " .. line .. " " .. icons.ui.Ellipsis 
end

vim.opt.winbar = "%{%v:lua.require'user.plugins.nvim-navic'.get_winbar()%}"

return M
