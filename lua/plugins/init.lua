vim.cmd [[packadd packer.nvim]]

local present, packer = pcall(require, "packer")

if not present then
    return false
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
        opt = true,
        event = "VimEnter",
    }

    use {
        "martinsione/darkplus.nvim"
    }

    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = "require('plugins.configs.nvimtree')"
    }

    use {
        "akinsho/bufferline.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = "require('plugins.configs.bufferline')"
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = "require('plugins.configs.lualine')"
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = "require('plugins.configs.others').blankline()"
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = "require('plugins.configs.others').colorizer()"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = "require('plugins.configs.treesitter')",
        run = ":TSUpdate",
    }

    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      config = "require('plugins.configs.gps')",
    }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = "require('plugins.configs.navic')",
  }

    use {
        "windwp/nvim-ts-autotag"
    }

    use {
        "numToStr/Comment.nvim",
        config = "require('plugins.configs.others').comment()"
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = "require('plugins.configs.others').gitsigns()"
    }

    use {
        "neovim/nvim-lspconfig",
        config = "require('plugins.configs.lspconfig')"
    }

    use {
        'williamboman/nvim-lsp-installer',
        config = "require('plugins.configs.others').lsp_installer()"
    }

    use {
        "hrsh7th/nvim-cmp",
        config = "require('plugins.configs.cmp')"
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
    }

    use {
        "hrsh7th/cmp-buffer",
    }

    use {
        "hrsh7th/cmp-path",
    }

    use {
        "hrsh7th/cmp-cmdline"
    }

    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
        "windwp/nvim-autopairs",
        config = "require('plugins.configs.others').autopairs()"
    }

    use {
        'moll/vim-bbye',
    }

    use {
        "blackCauldron7/surround.nvim",
        config = "require('plugins.configs.surround')"
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = "require('plugins.configs.telescope')",
    }

    use {
        'ahmedkhalf/project.nvim',
        config = "require('plugins.configs.project')",
    }

    use {
        'goolord/alpha-nvim',
        config = "require('plugins.configs.alpha')",
    }

    use {
        "akinsho/toggleterm.nvim",
        config = "require('plugins.configs.toggleterm')"
    }

    use {
        'folke/which-key.nvim',
        config = "require('plugins.configs.whichkey')",
    }

    use {
        'folke/todo-comments.nvim',
        config  = "require('plugins.configs.todo-comments')",
    }

    use {
        'Shatur/neovim-session-manager',
        config = "require('session_manager').setup {}"
    }

    use {
        'andymass/vim-matchup',
        config = "require('plugins.configs.others').matchup()"
    }

    use {
        'ChristianChiarulli/nvim-ts-rainbow',
        after = "nvim-treesitter"
    }

    use {
        "folke/zen-mode.nvim",
        config = "require('plugins.configs.others').zen_mode()"
    }

    use {
        "nacro90/numb.nvim",
        config = "require('plugins.configs.others').numb()"
    }

    use {
        "monaqa/dial.nvim",
        config = "require('plugins.configs.others').dial()"
    }

    use {
        "RRethy/vim-illuminate",
        config = "require('plugins.configs.others').illuminate()"
    }

    use {
        "MattesGroeger/vim-bookmarks",
        config = "require('plugins.configs.bookmarks')"
    }

    use {
        "tom-anders/telescope-vim-bookmarks.nvim",
        config = "require('telescope').load_extension('vim_bookmarks')"
    }

    use {
        "nvim-lua/popup.nvim"
    }

    use {
        "nvim-telescope/telescope-media-files.nvim",
        config = "require('telescope').load_extension('media_files')"
    }

    use {
        "rcarriga/nvim-notify",
        config = "require('plugins.configs.notify')"
    }

    use {
        "simrat39/symbols-outline.nvim",
        config = "require('plugins.configs.symbol-outline')"
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = "require('plugins.configs.lsp-signature')"
    }

    use {
        "folke/trouble.nvim",
        config = "require('plugins.configs.trouble')"
    }

    use {
        "karb94/neoscroll.nvim",
        config = "require('plugins.configs.others').neoscroll()"
    }

    use {
        "lewis6991/impatient.nvim",
        config = "require('plugins.configs.impatient')"
    }


    use "mfussenegger/nvim-dap"
    use "theHamsta/nvim-dap-virtual-text"
    use "Pocco81/DAPInstall.nvim"

end)
