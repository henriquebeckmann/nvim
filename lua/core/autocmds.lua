vim.cmd [[
    augroup _general_settings
    autocmd!
    autocmd FileType help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    augroup end

    augroup _spells
    autocmd FileType tex,gitcommit,text,markdown setlocal spell wrap
    augroup end

    augroup _terminal
    autocmd TermOpen term://* setlocal nohlsearch
    autocmd TermOpen term://* setlocal foldcolumn=0
    autocmd TermOpen term://* setlocal nospell
    augroup end

    autocmd FileType Outline setlocal foldcolumn=0

    autocmd VimEnter * highlight BufferLineBufferSelected cterm=bold gui=bold

    autocmd VimLeave * set guicursor=a:ver25
]]
-- autocmd VimEnter * NvimTreeOpen
-- autocmd VimEnter * wincmd l
