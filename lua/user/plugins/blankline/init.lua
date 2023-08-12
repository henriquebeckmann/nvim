local ok, blankline = pcall(require, "indent_blankline")

if not ok then
    return
end

blankline.setup {
    indentLine_enabled = 1,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char = "▏",
    buftype_exclude = { "terminal" },
    filetype_exclude = {
        "help",
        "startify",
        "alpha",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
    },
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
}

vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp="DodgerBlue", underline=true })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg="DodgerBlue" })
