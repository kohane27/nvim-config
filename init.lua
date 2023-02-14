-- Import Lua modules
require("lazy_init")
require("plugins.impatient") -- need to be at the top

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
require("plugins.project_nvim")
-- require("plugins.fzf-lua")

require("plugins.treesitter")
require("plugins.treesitter-context")
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
-- require("plugins.flit")
require("plugins.clever-f")
require("plugins.marks")
-- require("plugins.trailblazer")
require("plugins.grapple")
-- require("plugins.portal")

require("plugins.toggleterm")
require("plugins.fm-nvim")
require("plugins.lazygit")

require("plugins.luasnip")
require("plugins.trouble")
require("plugins.nvim-surround")
require("plugins.vim-visual-multi")

require("plugins.wilder")
-- require("plugins.live_command")
require("plugins.recorder")
require("plugins.dial")
-- require("plugins.obsidian")
require("plugins.neozoom")
require("plugins.beacon")
require("plugins.chafa")

require("plugins.tabout")
require("plugins.comment-box")
require("plugins.incline")
require("plugins.nvim-hlslens")
require("plugins.cinnamon")
require("plugins.notify")
require("plugins.nvim-scrollbar")
require("plugins.stabilize")
require("plugins.illuminate")
require("plugins.todo-comments")
require("plugins.nvim-lastplace")

-- require("plugins.ufo")
require("plugins.nvim-bqf")
require("plugins.pqf")

require("plugins.registers")
require("plugins.cutlass")
require("plugins.substitute")
require("plugins.stay-in-place")
require("plugins.gomove")

require("plugins.auto-save")
require("plugins.auto-session")

require("plugins.spectre")

require("plugins.vim-markdown")

require("plugins.code_runner")
require("plugins.sniprun")

-- require("plugins.codeium")

require("plugins.tmux")
require("plugins.vim-test")
require("plugins.delaytrain")

-- near end to override
require("plugins.legendary")
require("plugins.firenvim")
-- require("plugins.diffview")
-- require("plugins.git-conflict")
