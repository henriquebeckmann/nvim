local status_ok, _ = pcall(vim.cmd, "colorscheme darkplus")

if not status_ok then
    vim.g.colors_name = "default"
    vim.opt.background = "dark"
end
