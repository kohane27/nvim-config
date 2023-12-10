local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

-- I don't need it anymore?
-- https://github.com/L3MON4D3/LuaSnip/issues/656#issuecomment-1313310146
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   group = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true }),
--   pattern = { "s:n", "i:*" },
--   desc = "Forget the current snippet when leaving the insert mode",
--   callback = function(evt)
--     if ls.session and ls.session.current_nodes[evt.buf] and not ls.session.jump_active then
--       ls.unlink_current()
--     end
--   end,
-- })

-- only autosnippets for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    ls.setup({ enable_autosnippets = true })
  end,
})

-- TODO: auto expand
ls.add_snippets("markdown", { ls.parser.parse_snippet("```", "```bash\n$0\n\n") })

-- " imap ,f I have the following:\n\n```bash\n
-- " imap ,u I'm using ``. I have the following:\n\n```bash\n

-- TODO: cursor between first ``
ls.add_snippets("markdown", {
  s({ trig = ",diff", wordTrig = true }, { t("What is the difference between `` and ``?") }),
}, { type = "autosnippets" })

ls.add_snippets("markdown", {
  s({ trig = ",ty", wordTrig = true }, { t("Thank you!") }),
  s({ trig = ",gb", wordTrig = true }, { t("Thank you for getting back to me. I really appreciate it.") }),
  s({ trig = ",input", wordTrig = true }, { t("Any input is much appreciated. Thank you.") }),
  s({ trig = ",hi", wordTrig = true }, { t("Hello there. Hope you're doing well. Thank you for creating ") }),
  s({ trig = ",hope", wordTrig = true }, { t("Hope you're doing well. Thank you for getting back ") }),
}, { type = "autosnippets" })

ls.add_snippets("markdown", {
  s({ trig = ",date", wordTrig = true }, {
    f(function()
      return os.date("%Y-%m-%d")
    end, {}),
  }),
  s({ trig = ",time", wordTrig = true }, {
    f(function()
      return os.date("%H:%M:%S")
    end, {}),
  }),
}, { type = "autosnippets" })
