local ok, signature = pcall(require, "lsp_signature")
if not ok then
    return
end

local cfg = {
    debug = false,
    log_path = "~/.cache/nvim/lsp_signature.log",
    verbose = false,
    bind = true,
    doc_lines = 0,
    floating_window = false,
    floating_window_above_cur_line = true,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = icons.misc.Squirrel .. " ",
    hint_scheme = "Comment",
    use_lspsaga = false,
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 120,
    handler_opts = {
        border = "rounded"   
    },
    always_trigger = false,
    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,
    padding = '',
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = 'Black',
    timer_interval = 200,
    toggle_key = nil 
}

signature.setup(cfg) 
