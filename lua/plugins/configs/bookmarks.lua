local g = vim.g

g.bookmark_sign = ' '
g.bookmark_annotation_sign = ' '
g.bookmark_save_per_working_dir = 0
g.bookmark_auto_save = 1
g.bookmark_manage_per_buffer = 1
g.bookmark_auto_save_file = "~/.local/share/nvim/bookmarks"
g.bookmark_auto_close = 0
g.bookmark_highlight_lines = 0
g.bookmark_show_warning = 1
g.bookmark_show_toggle_warning = 1
g.bookmark_center = 1
g.bookmark_no_default_key_mappings = 1
g.bookmark_location_list = 0
g.bookmark_disable_ctrlp = 1
g.bookmark_display_annotation = 1

vim.cmd("highlight BookmarkSign guibg=NONE guifg=#0c7d9d")
vim.cmd("highlight BookmarkAnnotationSign guibg=NONE guifg=#D7BA7D")
