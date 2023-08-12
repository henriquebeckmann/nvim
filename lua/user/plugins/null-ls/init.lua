local ok, null_ls = pcall(require, "null-ls")

if not ok then
    return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.eslint,
  formatting.prettier,
  formatting.autopep8,
  formatting.stylua,
}

null_ls.setup({
  sources = sources,
})
