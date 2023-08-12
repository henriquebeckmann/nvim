local modules = {
    "user.core",
    "user.plugins",
    "user.lsp",
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

if vim.g.neovide then
  vim.o.guifont = "Fira Code Medium:h8"
  vim.g.neovide_input_use_logo = false
  vim.g.neovide_input_macos_alt_is_meta = false
end
