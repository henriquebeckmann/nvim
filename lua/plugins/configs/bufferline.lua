local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

map("n", ">", ":BufferLineMoveNext<CR>", opts)
map("n", "<", ":BufferLineMovePrev<CR>", opts)

map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

bufferline.setup {
    options = {
        numbers = "none",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        name_formatter = function(buf)
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,

        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated

        tab_size = 18,

        diagnostics = false,
        diagnostics_update_in_insert = false,

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,

        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
                padding = 1,
            }
        },

        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thick",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    }
}
