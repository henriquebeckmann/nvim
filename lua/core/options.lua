local set = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = " "

set.termguicolors = true
set.background = "dark"
cmd("colorscheme darkplus")

set.number = true
set.relativenumber = true
set.ruler = true
set.ttyfast = true

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true

set.smarttab = true
set.smartindent = true
set.smartcase = true

set.mouse = "a"

set.hidden = true

set.guicursor = { "n-v-sm:block", "i-c-ci-ve:ver25", "r-cr-o:hor20" }

set.cursorline = true
set.showmatch = true

set.colorcolumn = "80"

set.encoding = "utf-8"
cmd("language en_US.utf8")

set.spelllang = { "pt_br", "en_us" }

cmd("tab sball")
set.switchbuf = "useopen"
set.laststatus = 2

set.backspace = { "indent", "eol", "start" }

set.completeopt= "menu,menuone,noselect,noinsert"

set.clipboard = "unnamedplus"

set.foldcolumn = "4"
set.fillchars = "foldopen:,foldsep:⎹,foldclose:,fold: "
set.foldmethod = "manual"
set.foldlevel = 4

set.exrc = true

set.showcmd = true

set.showmode = false

set.wrap = true
set.textwidth = 120

set.list = false
set.listchars = "eol:↲,tab:▸ ,trail:·"

set.scrolloff = 1000

set.matchpairs:append("<:>") -- Use % to jump between pairs

set.incsearch = true
set.hlsearch = true
set.ignorecase = true

set.inccommand = "split"

set.splitbelow = true
set.splitright = true

set.pumheight = 10

set.wildmenu = true
set.wildmode = "full"

set.wildignore = {
	"*.ai", "*.bmp", "*.gif", "*.ico", "*.jpg", "*.jpeg", "*.png", "*.psd", "*.webp",
	"*.aux", "*.out", "*.toc",
	"*.avi", "*.divx", "*.mp4", "*.webm", "*.mov", "*.m2ts", "*.mkv", "*.vob", "*.mpg", "*.mpeg",
	"*.doc", "*.pdf", "*.cbr", "*.cbz", "*.docx", "*.ppt", "*.odt",
	"*.eot", "*.otf", "*.ttf", "*.woff",
	"*.mp3", "*.oga", "*.ogg", "*.wav", "*.flac",
	"*.o", "*.obj", "*.exe", "*.dll", "*.manifest", "*.rbc", "*.class", "*.jar", "*.iso",
	"*.swp", ".lock", ".DS_Store", "._*",
	"*.zip", "*.tar.gz", "*.tar.bz2", "*.rar", "*.tar.xz", "*.kgb",
	".git", ".hg", ".svn",
}

set.shell = "/bin/zsh"

cmd [[ 
    highlight Search guifg='#252525' guibg='#ff9632'
    highlight IncSearch guifg='#FFff00' guibg='#252525'
    highlight Visual guifg='None' guibg='#1e4173'
    highlight FoldColumn guibg='None' guifg='#808080'
]]
