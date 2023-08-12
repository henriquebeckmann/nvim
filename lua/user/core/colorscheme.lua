local set = vim.opt
local cmd = vim.cmd

set.termguicolors = true
set.background = "dark"

local ok, theme = pcall(vim.cmd, "colorscheme darkplus")

if not ok then
    cmd("colorscheme lunaperche")
end
