local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

-- remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

map("n", "<C-t>", ":enew<CR>", opts)
map("n", "<A-n>", "*<cmd>nohlsearch<CR>", opts)
map("n", "<A-p>", "#<cmd>nohlsearch<CR>", opts)
map("n", "<Esc>", ":nohlsearch<CR>", opts)

map("n", "Y", "yg$", opts)

map("n", "<C-h>",  "<C-w>h", opts)
map("n", "<C-j>",  "<C-w>j", opts)
map("n", "<C-k>",  "<C-w>k", opts)
map("n", "<C-l>",  "<C-w>l", opts)

map("n", "<C-w>h", ":hide<CR>", opts)
map("n", "<C-w>x", ":bd!<CR>", opts)

map("n", "<A-h>",  ":vertical resize -2<CR>", opts)
map("n", "<A-j>",  ":resize +2<CR>", opts)
map("n", "<A-k>",  ":resize -2<CR>", opts)
map("n", "<A-l>",  ":vertical resize +2<CR>", opts)

map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
