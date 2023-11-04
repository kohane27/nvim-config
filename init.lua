vim.loader.enable()
-- Import Lua modules
require("lazy_init")

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.colors")

require("lsp.mason")
require("lsp.mason_lspconfig")
require("lsp.lsp_config")
require("lsp.null_ls")
require("lsp.cmp")
require("lsp.vim_diagnostics")
require("lsp.lspsaga")

require("plugins.telescope")

require("plugins.treesitter")
require("plugins.treesitter-context")
require("plugins.rainbow-delimiters")
require("plugins.nvim-neoclip")
require("plugins.indent-blankline")
require("plugins.autopairs")
require("plugins.vim-matchup")

require("plugins.Comment")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.feline")
require("plugins.colorizer")
require("plugins.colortils")

require("plugins.leap")
require("plugins.flash")

-- require("plugins.flit")
require("plugins.find-extender")

require("plugins.telepath")
-- require("plugins.leap-spooky")

require("plugins.marks")
require("plugins.grapple")

require("plugins.toggleterm")
require("plugins.ranger")
require("plugins.glow")

require("plugins.lazygit")
require("plugins.diffview")

require("plugins.luasnip")
require("plugins.trouble")

require("plugins.nvim-surround")
require("plugins.vim-visual-multi")

require("plugins.wilder")
require("plugins.recorder")
require("plugins.dial")
require("plugins.neozoom")
require("plugins.beacon")

require("plugins.comment-box")
require("plugins.vim-caser")

require("plugins.incline")
require("plugins.nvim-hlslens")
require("plugins.cinnamon")
require("plugins.notify")

require("plugins.nvim-scrollbar")
require("plugins.nvim-scrollview")
require("plugins.illuminate")
require("plugins.todo-comments")
require("plugins.mini-misc")

require("plugins.ufo")
require("plugins.nvim-bqf")

require("plugins.registers")
require("plugins.cutlass")
require("plugins.substitute")
require("plugins.stay-in-place")
require("plugins.gomove")

require("plugins.auto-save")
require("plugins.auto-format")
require("plugins.auto-session")

require("plugins.spectre")

require("plugins.code_runner")
require("plugins.sniprun")

-- require("plugins.mkdnflow")

require("plugins.tmux")
-- require("plugins.vim-test")

-- require("plugins.delaytrain")

require("plugins.firenvim")

require("plugins.chatgpt")

-- near end to override
require("plugins.legendary")
-- override `legendary`
require("plugins.nap")
require("plugins.ledger")
