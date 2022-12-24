-- Import Lua modules
require("packer_init")
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
require("lsp.lsp_signature")
require("lsp.vim_diagnostics")
require("lsp.lspsaga")
require("lsp.goto_preview")

require("plugins.fzf-lua")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.treesitter-context")
require("plugins.nvim-neoclip")
require("plugins.autopairs")
require("plugins.Comment")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.barbar")
require("plugins.lualine")
require("plugins.project")
require("plugins.indent-blankline")
require("plugins.legendary")
require("plugins.colorizer")

require("plugins.leap")
require("plugins.flit")
require("plugins.grapple")
require("plugins.portal")
-- require("plugins.jump")

require("plugins.floaterm")
require("plugins.toggleterm")
require("plugins.luasnip")
require("plugins.trouble")
require("plugins.nvim-surround")
require("plugins.vim-visual-multi")

require("plugins.wilder")
require("plugins.neozoom")
require("plugins.beacon")
require("plugins.comment-box")
require("plugins.incline")
require("plugins.neoscroll")
require("plugins.nvim-hlslens")
require("plugins.nvim-scrollbar")
require("plugins.scrollview")
require("plugins.stabilize")
require("plugins.illuminate")
require("plugins.todo-comments")
require("plugins.nvim-lastplace")

require("plugins.diffview")
require("plugins.registers")

-- require("plugins.ufo")
require("plugins.nvim-bqf")
require("plugins.pqf")

require("plugins.cutlass")
require("plugins.substitute")
require("plugins.stay-in-place")

require("plugins.auto-save")
-- require("plugins.auto-session")

require("plugins.vim-markdown")
require("plugins.git-conflict")
require("plugins.code_runner")
require("plugins.sniprun")

require("plugins.tmux")
require("plugins.vim-test")
require("plugins.delaytrain")
-- require("plugins.firenvim")

if vim.g.vscode then
  require("plugins.leap")
else
  -- ordinary Neovim
end
