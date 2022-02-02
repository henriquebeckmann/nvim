local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

-- remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-t>", ":enew<CR>", opts)
map("n", "<A-n>", "*<cmd>nohlsearch<CR>", opts)
map("n", "<A-p>", "#<cmd>nohlsearch<CR>", opts)
map("n", "<Esc>", ":nohlsearch<CR>", opts)

map("n", "Y", "yg$", opts)

map("n", "<C-h>",  "<C-w>h", opts)
map("n", "<C-j>",  "<C-w>j", opts)
map("n", "<C-k>",  "<C-w>k", opts)
map("n", "<C-l>",  "<C-w>l", opts)

map("n", "<C-w>f", "<cmd>lua _ZEN_MODE()<CR>", opts)
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

local utils = require "core.utils"
local hooks = require "core.hooks"

local map = utils.map

local M =  {}

M.nvimtree = function()
    map { "n", "<leader>e", ":NvimTreeToggle<CR>" }
end

M.bufferline = function()
    map {"n", "<Tab>", ":BufferLineCycleNext<CR>" }
    map {"n", "<S-Tab>", ":BufferLineCyclePrev<CR>" }

    map { "n", ">", ":BufferLineMoveNext<CR>" }
    map { "n", "<", ":BufferLineMovePrev<CR>" }

    map { "n", "<leader>1", ":BufferLineGoToBuffer 1<CR>" }
    map { "n", "<leader>2", ":BufferLineGoToBuffer 2<CR>" }
    map { "n", "<leader>3", ":BufferLineGoToBuffer 3<CR>" }
    map { "n", "<leader>4", ":BufferLineGoToBuffer 4<CR>" }
    map { "n", "<leader>5", ":BufferLineGoToBuffer 5<CR>" }
    map { "n", "<leader>6", ":BufferLineGoToBuffer 6<CR>" }
    map { "n", "<leader>7", ":BufferLineGoToBuffer 7<CR>" }
    map { "n", "<leader>8", ":BufferLineGoToBuffer 8<CR>" }
    map { "n", "<leader>9", ":BufferLineGoToBuffer 9<CR>" }
end

M.comment = function()
    map{ "n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>" }
    map{ "v", "<leader>/", "<Esc><cmd>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<CR>" }
end

M.lspconfig = function()
    map {"n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" }
    map {"n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" }
    map {"n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" }
    map {"n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" }
    map {"n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>" }
    -- map {"n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" }
    -- map {"n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" }
    -- map {"n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" }
end

M.telescope = function()
    map { "n", "<leader>b", ":lua require('telescope.builtin').buffers()<cr>"}
    map { "n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>" }
    map { "n", "<leader>F", ":lua require'telescope.builtin'.live_grep()<cr>" }
end

M.toggleterm = function()
    map { "n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>" }
    map { "n", "<leader>gg", "<cmd>lua _HTOP_TOGGLE()<cr>" }
    map { "n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>" }
    map { "n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>" }
    map { "n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>" }
    map { "n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>" }
    map { "n", "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<cr>" }
end

return M
