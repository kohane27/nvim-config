local luasnip = require("luasnip")

luasnip.config.set_config({
  region_check_events = "CursorHold,InsertLeave", -- fix duplication
  delete_check_events = "TextChanged,InsertEnter", -- fix duplication
  -- Update more often, :h events for more info.
  update_events = "TextChanged,TextChangedI",
})

-- -- snippets to frameworks
-- luasnip.filetype_extend("javascript", { "javascript" })
-- luasnip.filetype_extend("javascript", { "typescript" })
-- luasnip.filetype_extend("javascript", { "javascriptreact" })
-- luasnip.filetype_extend("javascript", { "html" })
