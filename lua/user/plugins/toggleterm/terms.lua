local M = {}

M.toggleterm =  function()
    local Terminal = require("toggleterm.terminal").Terminal


    local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
    function _HTOP_TOGGLE()
        htop:toggle()
    end

    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
    end

    local node = Terminal:new({ cmd = "node", hidden = true })
    function _NODE_TOGGLE()
        node:toggle()
    end

    local python = Terminal:new({ cmd = "python", hidden = true })
    function _PYTHON_TOGGLE()
        python:toggle()
    end
end

return M
