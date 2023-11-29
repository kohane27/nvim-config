local ls = require("luasnip")

local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = unlinkgrp,
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    if ls.session and ls.session.current_nodes[evt.buf] and not ls.session.jump_active then
      ls.unlink_current()
    end
  end,
})

ls.config.set_config({
  history = false,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
})

ls.add_snippets("markdown", { ls.parser.parse_snippet("```", "```bash\n$0\n\n") })
