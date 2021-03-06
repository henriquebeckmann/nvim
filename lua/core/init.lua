local set = vim.opt
local cmd = vim.cmd

set.termguicolors = true
set.background = "dark"
cmd("colorscheme darkplus")


cmd("language en_US.utf8")

cmd("tab sball")

cmd [[ 
    highlight Search guifg='#252525' guibg='#ff9632'
    highlight IncSearch guifg='#FFff00' guibg='#252525'
    highlight Visual guifg='None' guibg='#1e4173'
    highlight FoldColumn guibg='None' guifg='#808080'
]]

require "plugins"

cmd [[
    function! MyFoldText()
    let line = getline(v:foldstart)
    let lnum = v:foldend - v:foldstart + 1
    let line_text = substitute(line, '^"{\+', '', 'g')
    -- return line_text
    return ' '. lnum . ' lines: ' . line_text
    endfunction
]]

cmd [[
    augroup MyVisualListchars
    autocmd!

    autocmd CursorMoved * if mode() =~# "[vV\<C-v>]" | set list | else | set nolist | endif

    augroup END
]]
