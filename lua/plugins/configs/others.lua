local M = {}

M.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

    if present1 and present2 then
        autopairs.setup()

        local cmp = require "cmp"
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
end

M.blankline = function()
    local present, blankline = pcall(require, "indent_blankline")
    if present then
        blankline.setup {
            indentLine_enabled = 1,
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = false,
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
            show_first_indent_level = false,
        }
    end
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup({ "*" }, {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            names = false, -- "Name" codes like Blue
            RRGGBBAA = false, -- #RRGGBBAA hex codes
            rgb_fn = false, -- CSS rgb() and rgba() functions
            hsl_fn = false, -- CSS hsl() and hsla() functions
            css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

            -- Available modes: foreground, background
            mode = "background", -- Set the display mode.
        })
        vim.cmd "ColorizerAttachToBuffer"
    end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "Comment")
    if present then
        local map = vim.api.nvim_set_keymap

        local opts = {noremap = true, silent = true}

        map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current(nil)<CR>", opts)
        map("v", "<leader>/", "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
        nvim_comment.setup()

        vim.cmd("highlight Comment gui=NONE")
    end
end

M.gitsigns = function()
    local present, gitsigns = pcall(require, "gitsigns")
    if present then
        gitsigns.setup {
            signs = {
                add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                delete       = {hl = 'GitSignsDelete', text = '━', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                topdelete    = {hl = 'GitSignsDelete', text = '━', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                changedelete = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            },

            signcolumn = true,
            numhl      = false,
            linehl     = false,
            word_diff  = false,

            current_line_blame = true,

            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
  },
        }
    end
end

M.lsp_installer = function()
    local lsp_installer = require("nvim-lsp-installer")

    lsp_installer.on_server_ready(function(server)
        local capabilities = require('cmp_nvim_lsp')
        .update_capabilities(vim.lsp.protocol.make_client_capabilities())

        local opts = { capabilities = capabilities }

        server:setup(opts)
    end)
end

M.matchup = function()
    vim.g.matchup_matchparen_offscreen = { method = nil }
    vim.cmd [[ 
        highlight MatchParen cterm=bold gui=bold
        highlight MatchParenCur cterm=bold gui=bold
        highlight MatchWord cterm=bold,italic gui=bold,italic
        highlight MatchWordCur cterm=bold,italic gui=bold,italic
    ]]
end

M.zen_mode = function()
    local status_ok, zen_mode = pcall(require, "zen-mode")
    if status_ok then
        vim.api.nvim_set_keymap(
        "n",
        "<C-w>f",
        "<cmd>lua _ZEN_MODE()<CR>", 
        {noremap = true, silent = true})

        zen_mode.setup {}
        require("plugins.utils").zen_mode()
    end
end

M.numb = function()
    local is_ok, numb = pcall(require, "numb")
    if not is_ok then
        return
    end

    numb.setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
    }
end

M.dial = function()
    local is_ok, dial = pcall(require, "dial")
    if not is_ok then
        return
    end

    vim.cmd([[
    nmap <C-a> <Plug>(dial-increment)
    nmap <C-x> <Plug>(dial-decrement)
    vmap <C-a> <Plug>(dial-increment)
    vmap <C-x> <Plug>(dial-decrement)
    vmap g<C-a> <Plug>(dial-increment-additional)
    vmap g<C-x> <Plug>(dial-decrement-additional)
    ]])

    table.insert(dial.config.searchlist.normal, "markup#markdown#header")

    dial.augends["custom#boolean"] = dial.common.enum_cyclic{
        name = "boolean",
        strlist = {"true", "false"},
    }
    table.insert(dial.config.searchlist.normal, "custom#boolean")

    -- For Languages which prefer True/False, e.g. python.
    dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
        name = "Boolean",
        strlist = { "True", "False" },
    })
    table.insert(dial.config.searchlist.normal, "custom#Boolean")
end

M.illuminate = function()
    vim.cmd("highlight illuminatedWord guibg=#2f2f2f")

    vim.g.Illuminate_ftblacklist = {
        "help",
        "startify",
        "alpha",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "terminal",
        "toggleterm",
    }
end

M.neoscroll = function()
    local status_ok, neoscroll = pcall(require, "neoscroll")
    if not status_ok then
        return
    end

    neoscroll.setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
    }
end

return M
