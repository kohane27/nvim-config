local ls = require("luasnip")

ls.config.set_config({
  history = false, -- TODO: maybe fixed duplication bug?
  region_check_events = "CursorHold,InsertLeave", -- fix duplication
  delete_check_events = "TextChanged,InsertEnter", -- fix duplication
  -- Update more often, :h events for more info.
  update_events = "TextChanged,TextChangedI",
})
