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
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
    use("famiu/bufdelete.nvim")
    -- use("romgrk/barbar.nvim")
    use("moll/vim-bbye")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/toggleterm.nvim")
    -- use("tpope/vim-unimpaired")
    -- use("tpope/vim-fugitive")
    use("tpope/vim-obsession")
    use("tpope/vim-markdown")
    use("sindrets/diffview.nvim")
    -- use("whiteinge/diffconflicts")
    use("ahmedkhalf/project.nvim")
    use("lewis6991/impatient.nvim")
    use("goolord/alpha-nvim")
    use("antoinemadec/FixCursorHold.nvim") -- needed to fix lsp doc highlight
    use("folke/which-key.nvim")
    use("folke/lsp-colors.nvim")
    use("folke/trouble.nvim")
    -- use({ "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } })
    -- Colorschemes/theme
    use("lunarvim/colorschemes") -- A bunch of colorschemes
    use("lunarvim/darkplus.nvim")
    use("NTBBloodbath/doom-one.nvim")
    -- use("EdenEast/nightfox.nvim")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
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

    -- TODO For vsnip users
    -- use 'hrsh7th/cmp-vsnip'
    -- use 'hrsh7th/vim-vsnip'

    -- For luasnip users
    -- use 'saadparwaiz1/cmp_luasnip'

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

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- git
    use("lewis6991/gitsigns.nvim")

    -- with its own file
    use("norcalli/nvim-colorizer.lua")
    use("ggandor/lightspeed.nvim")
    --use 'ggandor/leap.nvim'
    -- use "rmagatti/auto-session"
    use("jremmen/vim-ripgrep")
    use("farmergreg/vim-lastplace")
    -- use "Pocco81/AutoSave.nvim"
    use("mbbill/undotree")
    -- use("vimwiki/vimwiki")
    use("EvanQuan/vim-executioner")
    use("voldikss/vim-floaterm")
    use("tpope/vim-surround")
    use("preservim/tagbar")
    use("ray-x/lsp_signature.nvim")
    use("windwp/nvim-ts-autotag")
    use("lukas-reineke/indent-blankline.nvim")

    -- without its own file
    use("p00f/nvim-ts-rainbow")
    use("ThePrimeagen/harpoon")
    use("junegunn/vim-emoji")
    use("sheerun/vim-polyglot")
    use("kovetskiy/sxhkd-vim")
    use("romainl/vim-cool") -- remove search result highlight
    use({ "mg979/vim-visual-multi", branch = "master" })
    use("junegunn/vim-peekaboo")
    use("tpope/vim-repeat")
    use("psliwka/vim-smoothie")
    use("wellle/targets.vim")
    use("kevinhwang91/nvim-bqf")
    use("junegunn/fzf.vim") -- for nvim-bqf
    use("mhinz/vim-grepper")

    use("andymass/vim-matchup")
    use("mhinz/vim-sayonara")
    use("danilamihailov/beacon.nvim")
    use("mfussenegger/nvim-jdtls")
    use("sunaku/tmux-navigate")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
