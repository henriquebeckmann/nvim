local ok, zen_mode = pcall(require, "zen-mode")
if not ok then
  return
end

zen_mode.setup {
  window = {
    backdrop = 1,
    height = 1,
    width = 1,
    options = {
      signcolumn = "yes",
      number = true,
      relativenumber = true,
      cursorline = true,
      cursorcolumn = false, -- disable cursor column
      foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  },
}

vim.keymap.set("n", "<leader>zz", zen_mode.toggle)
