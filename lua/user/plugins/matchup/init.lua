vim.g.matchup_matchparen_offscreen = {
    method = nil
}

vim.api.nvim_set_hl(0, 'MatchParen', { bg="#363636", bold=true })
vim.api.nvim_set_hl(0, 'MatchParenCur', { bg="#363636", bold=true })
vim.api.nvim_set_hl(0, 'MatchWord', { bg="NONE", bold=true, italic=true })
vim.api.nvim_set_hl(0, 'MatchWordCur', { bg="NONE", bold=true, italic=true })
