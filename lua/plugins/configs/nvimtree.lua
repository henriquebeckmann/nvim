local status_ok, nvimtree = pcall(require, "nvim-tree")

if not status_ok then
   return
end

vim.cmd("highlight NvimTreeOpenedFolderName gui=NONE")

local g = vim.g

g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 0
g.nvim_tree_disable_window_picker = 0
g.nvim_tree_icon_padding = ' '
g.nvim_tree_symlink_arrow = ' ➛ '
g.nvim_tree_respect_buf_cwd = 0
g.nvim_tree_create_in_closed_folder = 1
g.nvim_tree_refresh_wait = 1000

g.nvim_tree_window_picker_exclude = {
       filetype = {
         "notify",
         "packer",
         "qf"
       },
       buftype = {
         "terminal"
       }
     }

g.nvim_tree_show_icons = {
     git = 1,
     folders = 1,
     files = 1,
     folder_arrows = 1,
     }

g.nvim_tree_icons = {
     default = "",
     symlink = "",
     git = {
       unstaged = "✗",
       staged = "✓",
       unmerged = "",
       renamed = "➜",
       untracked = "★",
       deleted = "",
       ignored = "◌"
       },
     folder = {
       arrow_open = "",
       arrow_closed = "",
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       symlink_open = "",
       }
     }

nvimtree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
