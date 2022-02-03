local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

require("plugins.utils").toggleterm()

require("toggleterm").setup{
  size = 10,
  open_mapping = [[<c-_>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float', -- | 'vertical' | 'horizontal' | 'window' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved', -- | 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  }
}
