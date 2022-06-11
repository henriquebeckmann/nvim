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
map("v", "p", '"_dP', opts)
map("x", "y", 'ygv', opts)

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
map("t", "<A-h>", "<Left>", opts)
map("t", "<A-j>", "<Down>", opts)
map("t", "<A-k>", "<Up>", opts)
map("t", "<A-l>", "<Right>", opts)

map("i", "<A-h>", "<Left>", opts)
map("i", "<A-j>", "<Down>", opts)
map("i", "<A-k>", "<Up>", opts)
map("i", "<A-l>", "<Right>", opts)
map("i", "<C-c>", "<Esc>", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

local delete_keys = {
    { lhs = "c", rhs = '"_c', modes = { "n", "x" } },
    { lhs = "cc", rhs = '"_S', modes = { "n" } },
    { lhs = "C", rhs = '"_C', modes = { "n", "x" } },
    { lhs = "s", rhs = '"_s', modes = { "n", "x" } },
    { lhs = "S", rhs = '"_S', modes = { "n", "x" } },
    { lhs = "d", rhs = '"_d', modes = { "n", "x" } },
    { lhs = "dd", rhs = '"_dd', modes = { "n" } },
    { lhs = "D", rhs = '"_D', modes = { "n", "x" } },
    { lhs = "x", rhs = '"_x', modes = { "n" } },
    { lhs = "X", rhs = '"_X', modes = { "n", "x" } },
    { lhs = "<Del>", rhs = '"_x', modes = { "n", "x" } },
  }

for _, key in ipairs(delete_keys) do
  for _, mode in ipairs(key.modes) do
      map(mode, key.lhs, key.rhs, opts)
  end
end
