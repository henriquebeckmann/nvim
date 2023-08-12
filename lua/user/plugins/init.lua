local fn = vim.fn

-- Automatically install Packer.
local installPath = fn.stdpath 'data' .. '/site/pack/packer/start/packer.vim'
if fn.empty(fn.glob(installPath)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        installPath,
    }
    print 'Installing packer. Restart Neovim.'
    -- Only used if packer is installed in packer/opt/ instead of packer/start
    --vim.cmd 'packadd packer.nvim'
end

-- Reload Neovim whenever you save the plugins.lua file.
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Only move on if we can require Packer.
local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {border = 'rounded'}
        end,
    }
}

-- Plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have Packer manage itself

    use "lunarvim/darkplus.nvim"

    use {
        "goolord/alpha-nvim",
        config = "require('user.plugins.alpha')"
    }

    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = "require('user.plugins.nvim-tree')"
    }

    use {
        "akinsho/bufferline.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = "require('user.plugins.bufferline')"
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = "require('user.plugins.lualine')"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
        },
        config = "require('user.plugins.treesitter')",
        run = ":TSUpdate",
    }

    use {
        "ChristianChiarulli/nvim-ts-rainbow",
        after = "nvim-treesitter"
    }

    use {
        "neovim/nvim-lspconfig",
        requires = {
            "ray-x/lsp_signature.nvim",
        }
    }

    use {
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = "require('user.plugins.mason')"
    }
    use {
        "j-hui/fidget.nvim",
        config = "require('fidget').setup()"
    }

    use "tpope/vim-fugitive"

    use {
        "kevinhwang91/nvim-bqf",
        config = "require('user.plugins.bqf')"
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lua",
        },
        config = "require('user.plugins.cmp')"
    }

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = "require('user.plugins.telescope')"
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }

    use {
        "SmiteshP/nvim-navic",
        config = "require('user.plugins.nvim-navic')"
    }

    use {
        "kylechui/nvim-surround",
        config = "require('user.plugins.surround')"
    }

    use {
        "akinsho/toggleterm.nvim",
        config = "require('user.plugins.toggleterm')"
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = "require('user.plugins.gitsigns')"
    }

    use {
        "windwp/nvim-autopairs",
        config = "require('user.plugins.autopairs')"
    }

    use {
        "andymass/vim-matchup",
        config = "require('user.plugins.matchup')"
    }

    use {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = "require('user.plugins.comment')"
    }

    use {
        "RRethy/vim-illuminate",
        event = "BufRead",
        config = "require('user.plugins.illuminate')"
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = "require('user.plugins.blankline')"
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = "require('user.plugins.nvim-colorizer')"
    }

    use {
        "folke/todo-comments.nvim",
        config  = "require('user.plugins.todo-comments')",
    }

    use {
        "monaqa/dial.nvim",
        config = "require('user.plugins.dial')"
    }

    use {
        "folke/which-key.nvim",
        config = "require('user.plugins.which-key')",
    }

    use {
        "folke/zen-mode.nvim",
        config = "require('user.plugins.zen-mode')"
    }

    use {
        "nacro90/numb.nvim",
        config = "require('user.plugins.numb')"
    }

  use('jose-elias-alvarez/null-ls.nvim')
end)
