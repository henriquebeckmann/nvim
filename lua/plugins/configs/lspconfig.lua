if not pcall(require, "lspconfig") then
    return
end

local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- map {"n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" }
-- map {"n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" }
-- map {"n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" }

local set = vim.opt

set.updatetime = 250

local signs = { Error = "", Warn = "", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "", -- Could be '■', '●', '▎', 'x'
  }
})
