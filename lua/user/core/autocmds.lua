local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "Hightlight selection on yank",
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'Visual',
            timeout = 100,
        })
    end,
})

autocmd("BufWritePre", {
    desc = "Remove whitespace before saving the file",
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

-- autocmd("VimLeave", {
--     desc = "Set the cursor to beam when leaving",
--     pattern = '*',
--     callback = function()
--         vim.opt.guicursor = { "a:ver25" }
--     end,
-- })
