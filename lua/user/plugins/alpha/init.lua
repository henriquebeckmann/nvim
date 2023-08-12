local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("s", "  Find Session", ":Telescope sessions save_current=false <CR>"),
    dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = "henrique@archlinux"

dashboard.section.header.opts = {
    position = "center",
    hl = "Label",
}
dashboard.section.buttons.opts = {
    hl_shortcut = "Include",
    spacing = 1,
}

dashboard.section.footer.opts = {
    position = "center",
    hl = "Number",
}

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
