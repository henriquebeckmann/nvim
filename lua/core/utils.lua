local M = {}

M.map = function(key)
  local opts = { noremap = true, silent = true }
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- fix language installation with packer
M.netrw = function()
    if not pcall(vim.g, "loaded_netrw") then
        return vim.cmd [[ runtime! autoload/netrw.vim ]]
    end
end

return M
