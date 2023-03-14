local ls = require("luasnip")

ls.config.set_config({
  history = false,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
})
