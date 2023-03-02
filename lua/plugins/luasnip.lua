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

-- -- snippets to frameworks
-- luasnip.filetype_extend("javascript", { "javascript" })
-- luasnip.filetype_extend("javascript", { "typescript" })
-- luasnip.filetype_extend("javascript", { "javascriptreact" })
-- luasnip.filetype_extend("javascript", { "html" })
