if not pcall(require, "lspconfig") then
    return
end

require("core.mappings").lspconfig()

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
