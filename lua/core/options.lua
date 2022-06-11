local set = vim.opt

set.number = true                           -- set numbered lines
set.relativenumber = true                   -- set relative numbered lines

set.splitbelow = true                       -- force all horizontal splits to go below current window
set.splitright = true                       -- force all vertical splits to go to the right of current window

set.incsearch = true                        -- show where the pattern while typing a search command
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.smartcase = true                        -- smart case

set.iskeyword:append("-")                 -- keyword are used in searching and recognizing with many commands

set.tabstop = 2                             -- number of spaces that a <Tab> in the file counts for
set.shiftwidth = 2                         -- number of spaces to use for each step of (auto)indent
set.expandtab = true                        -- convert tabs to spaces
set.smarttab = true                         -- convert tabs to spaces

set.autoindent = true                       -- copy indent from current line when starting a new line
set.smartindent = true                      -- do smart autoindenting when starting a new line

set.formatoptions:remove("cro")             -- how automatic formatting is to be done

set.guifont = "monospace:h17"               -- the font used in graphical neovim applications

set.cursorline = true                       -- highlight the current line
set.scrolloff = 999                         -- minimal number of screen lines to keep above and below the cursor
set.guicursor = {                           -- configures the cursor style for each mode
    "n-v-sm:block",
    "i-c-ci-ve:ver25",
    "r-cr-o:hor20"
}

set.mouse = "a"                             -- enables mouse support

set.colorcolumn = "100"                      -- highlighted column  number (default "")

set.showmatch = true                        -- highlight pairs
set.matchpairs:append("<:>")                 -- use % to jump between pairs

set.list = false                            -- show listchars
set.listchars = "eol:↲,tab:▸ ,space:·"      -- strings to use in 'list' mode
set.conceallevel = 0                        -- so that `` is visible in markdown files

set.fileencoding = "utf-8"                  -- the encoding written to a file

set.spell = true                           -- spell checking
set.spelllang = {"pt_br", "en_us"}          -- spell check languages

set.completeopt= {"menuone", "noselect"}    -- options for insert mode completion
set.updatetime = 300                        -- faster completion (default 4000)
set.pumheight = 10                          -- pop up menu height

set.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)

set.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

set.backspace = {"indent", "eol", "start"}  -- influences the working of <BS> and <Del> in insert mode

set.signcolumn = "yes:1"                    -- show the sign column

set.foldcolumn = "0"                        -- when and how to draw the foldcolumn
set.fillchars = "foldopen:,foldsep:⎹,foldclose:,fold: " -- characters to fill the statuslines and vertical separators
set.foldtext = "MyFoldText()"
set.foldmethod = "manual"                   -- the kind of folding used for the current window
set.foldlevel = 4                           -- folds with a higher level will be closed

set.textwidth = 120                         -- maximum width of text that is being inserted

set.wrap = true                             -- wrap line

-- set.whichwrap:append("h,l")                 -- allow specified keys to move to the previous/next line

set.switchbuf = "useopen"                   -- behavior when switching between buffers

set.undofile = false                         -- enable persistent undo

set.laststatus = 3                          -- when the last window will have a status line (0: never, 1: only if there are at least two window, 2: always)

set.wildmenu = true                         -- enables "enhanced mode" of command-line completion
set.wildmode = "full"                       -- completation mode

set.showcmd = true                          -- show command in the last line of the screen
set.cmdheight = 1                           -- space in the neovim command line
set.showmode = false                        -- if in insert, replace or visual mode put a message on the last line

set.backup = false                          -- creates a backup file
set.swapfile = false                        -- creates a swapfile
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

set.shell = "/bin/zsh"                      -- set default neovim shell

set.exrc = true
