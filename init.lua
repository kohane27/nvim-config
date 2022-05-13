-- Import Lua modules
require("packer_init")

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.colors")

require("lsp.lsp_installer")
require("lsp.lsp_config")
require("lsp.null_ls")
require("lsp.cmp")
--require("lsp.code_action_utils")
require("lsp.lsp_signature")
require("lsp.vim_diagnostics")
--require("lsp.lsp_format")

require("plugins.telescope")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.Comment")
require("plugins.easy-align")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.project")
require("plugins.impatient")
require("plugins.indentline")
require("plugins.whichkey")
require("plugins.colorizer")
require("plugins.lightspeed")
-- require("plugins.leap")
require("plugins.ripgrep")
-- require("plugins.lastplace")
require("plugins.beacon")
require("plugins.undotree")
require("plugins.executioner")
require("plugins.floaterm")
require("plugins.luasnip")
require("plugins.indent-blankline")
require("plugins.vim-visual-multi")
require("plugins.trouble")
require("plugins.firenvim")
require("plugins.sandwitch")
require("plugins.targets")
require("plugins.neoscroll")
require("plugins.LargeFile")
-- require("plugins.better-escape")
require("plugins.substitute")
require("plugins.startify")
require("plugins.wilder")
require("plugins.symbols-outline")
require("plugins/scrollview")
-- require("plugins.sad")
-- require("plugins.nvim-bqf")

require("plugins.cutlass") -- BUG?
-- require("plugins.yanky") -- BUG?
-- require("plugins.yoink") -- BUG?
