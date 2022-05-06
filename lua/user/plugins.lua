local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
    use("numToStr/Comment.nvim") -- Easily comment stuff
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use({ "akinsho/bufferline.nvim", tag = "*" })
    use("nvim-lualine/lualine.nvim")
    use("akinsho/toggleterm.nvim")
    -- use("tpope/vim-unimpaired")
    -- use("tpope/vim-fugitive")
    use("tpope/vim-obsession")
    use("tpope/vim-repeat")
    -- use("tpope/vim-markdown")
    -- use("anuvyklack/pretty-fold.nvim")
    use("sindrets/diffview.nvim")
    -- use("whiteinge/diffconflicts")
    use("ahmedkhalf/project.nvim")
    use("lewis6991/impatient.nvim")
    -- use("goolord/alpha-nvim")
    use("mhinz/vim-startify")
    use("antoinemadec/FixCursorHold.nvim") -- needed to fix lsp doc highlight
    use("folke/which-key.nvim")
    use("folke/lsp-colors.nvim")

    -- Colorschemes/theme
    -- use("lunarvim/colorschemes") -- A bunch of colorschemes
    use("NTBBloodbath/doom-one.nvim")
    use("marko-cerovac/material.nvim")
    use("EdenEast/nightfox.nvim")
    use("joshdick/onedark.vim")
    use("LunarVim/onedarker.nvim")
    use("bluz71/vim-moonfly-colors")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- auto-completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("b0o/schemastore.nvim")
    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- Additional textobjects for treesitter
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- For vsnip users
    -- use 'hrsh7th/cmp-vsnip'
    -- use 'hrsh7th/vim-vsnip'
    -- For luasnip users
    -- For ultisnips users
    -- use 'SirVer/ultisnips'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- For snippy users
    -- use 'dcampos/nvim-snippy'
    -- use 'dcampos/cmp-snippy'

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- language server installer
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    -- use("mfussenegger/nvim-lint")
    use("lukas-reineke/lsp-format.nvim")
    use("lewis6991/gitsigns.nvim")

    use("norcalli/nvim-colorizer.lua")
    use("ggandor/lightspeed.nvim")
    -- use "rmagatti/auto-session"
    -- use "Pocco81/AutoSave.nvim"
    use("jremmen/vim-ripgrep")
    use("mbbill/undotree")
    use("EvanQuan/vim-executioner")
    use("voldikss/vim-floaterm")
    use("windwp/nvim-ts-autotag")

    -- Add indentation guides even on blank lines
    use("lukas-reineke/indent-blankline.nvim")
    use("machakann/vim-sandwich") -- better than surround

    use("takac/vim-hardtime")
    use("jose-elias-alvarez/typescript.nvim")
    use("gbprod/cutlass.nvim")
    use("gbprod/substitute.nvim")
    -- use("gbprod/yanky.nvim") --BUG FREEZES nvim
    -- use("svermeulen/vim-yoink")

    -- use("preservim/tagbar")
    -- use { 'ray-x/navigator.lua',
    --     requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
    -- }
    use("ray-x/sad.nvim")
    use("ray-x/lsp_signature.nvim")

    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

    use({ "mg979/vim-visual-multi", branch = "master" })
    use("ethanholz/nvim-lastplace")
    use("karb94/neoscroll.nvim")
    use("max397574/better-escape.nvim")
    use("wellle/targets.vim")
    use("kevinhwang91/nvim-bqf")
    use("mhinz/vim-grepper")
    use("danilamihailov/beacon.nvim")
    use("folke/trouble.nvim")

    use({
        "glacambre/firenvim",
        run = function()
            vim.fn["firenvim#install"](0)
        end,
    })

    -- without its own file
    use("p00f/nvim-ts-rainbow")
    use("ThePrimeagen/harpoon")
    use("junegunn/vim-emoji")
    use("sheerun/vim-polyglot")
    use("kovetskiy/sxhkd-vim")
    use("junegunn/vim-peekaboo")
    use("romainl/vim-cool") -- remove search result highlight
    use("junegunn/fzf.vim") -- for nvim-bqf
    use("andymass/vim-matchup")
    -- use("mhinz/vim-sayonara")
    use("mfussenegger/nvim-jdtls")
    use("sunaku/tmux-navigate")
    use("famiu/bufdelete.nvim")
    use("moll/vim-bbye")
    -- use("chaoren/vim-wordmotion")
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
