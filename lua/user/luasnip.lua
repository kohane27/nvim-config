local luasnip = require("luasnip")
local types = require("luasnip.util.types")
luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			activate = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
})
-- vsnip
require("luasnip.loaders.from_vscode").load({
	paths = {
		"~/.local/share/nvim/site/pack/packer/start/friendly-snippets",
		"~/.config/nvim/snippets",
	},
})
