local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

treesitter.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
   matchup = {
       enable = true,
   },
   rainbow = {
       enable = true,
       extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
       max_file_lines = nil, -- Do not enable for files with more than n lines, int
       colors = {
           "Gold",
           "Orchid",
           "DodgerBlue",
           -- "Cornsilk",
           -- "Salmon",
           -- "LawnGreen",
       }, -- table of hex strings
       -- termcolors = {} -- table of colour name strings
       disable = { "html" },
   },
   autotag = {
       enable = true,
   },
}

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"