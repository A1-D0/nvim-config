-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }


    -- lua/plugins/rose-pine.lua
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- LSP Plugins
    -- use 'VonHeikemen/lsp-zero.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"

    -- Autocompletion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use("tpope/vim-dadbod") 
    use("kristijanhusak/vim-dadbod-completion") 
    use("kristijanhusak/vim-dadbod-ui") 

    use({
        "pmizio/typescript-tools.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("typescript-tools").setup({
                settings = {
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all",
                        includeCompletionsForModuleExports = true,
                    },
                    tsserver_format_options = {
                        allowIncompleteCompletions = true,
                        semicolons = "insert",
                    },
                },
            })
        end,
    })

    -- Comment ability
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
       end
    }

    -- colors for csv files
    use {
        "hat0uma/csvview.nvim",
        config = function()
            require("csvview").setup({
                parser = { comments = { "#", "//" } },
                view = {
                    display_mode = "border",  -- repo uses display_mode
                },
            })
        end,
    }

end)

