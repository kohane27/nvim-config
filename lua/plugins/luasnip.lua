return {
  "L3MON4D3/LuaSnip",
  lazy = false,
  build = "make install_jsregexp",
  dependencies = {
    -- completion engine
    "saadparwaiz1/cmp_luasnip",
    -- provided snippets
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip").setup({})

    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local l = require("luasnip.extras").lambda
    local rep = require("luasnip.extras").rep
    local p = require("luasnip.extras").partial
    local m = require("luasnip.extras").match
    local n = require("luasnip.extras").nonempty
    local dl = require("luasnip.extras").dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local types = require("luasnip.util.types")
    local conds = require("luasnip.extras.expand_conditions")

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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown simple snippets                                 │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = ",f", wordTrig = true }, { t("following ") }),
      s({ trig = ",ty", wordTrig = true }, { t("Thank you.") }),
      s({ trig = ",todo", wordTrig = true }, { t("Complete the TODO comment in the code please.") }),
      s({ trig = ",hi", wordTrig = true }, { t("Hello! Hope you're doing well. Thank you for getting back ") }),
      s({ trig = ",input", wordTrig = true }, { t("Any input is much appreciated. Thank you.") }),
      s({ trig = ",gb", wordTrig = true }, { t("Thank you for getting back to me. I really appreciate it.") }),
      s({ trig = ",yt", wordTrig = true }, { t("YouTube") }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown multi-line snippets                             │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = "```", wordTrig = true }, {
        t({ "```bash", "" }),
        i(0),
        t({ "", "" }),
      }),

      -- s({ trig = ",f", wordTrig = true }, {
      --   t({ "", "I have the following:" }),
      --   -- Linebreak
      --   t({ "", "" }),
      --   t({ "", "" }),
      --   t({ "```bash", "" }),
      --   i(0),
      --   t({ "", "" }),
      --   t({ "```", "" }),
      -- }),

      s({ trig = ",u", wordTrig = true }, {
        t({ "I'm using `" }),
        i(1),
        t({ "`." }),
      }),

      s({ trig = ",diff", wordTrig = true }, {
        t({ "What is the difference between `" }),
        i(1),
        t({ "` and `" }),
        i(2),
        t({ "` ?" }),
      }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown functions                                       │
    --  ╰──────────────────────────────────────────────────────────╯
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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ javascript                                               │
    --  ╰──────────────────────────────────────────────────────────╯
    local log_snippet = s({ trig = "log", wordTrig = true }, {
      t({ "console.log(" }),
      i(0),
      t({ ");" }),
    })

    local import_react = s({ trig = "id", wordTrig = true }, {
      t({ "import {" }),
      i(0),
      t({ "} from 'react';" }),
    })

    local return_fragment = s({ trig = "rf", wordTrig = true }, {
      t({ "return (", "" }),
      t({ "<>", "" }),
      i(0),
      t({ "", "" }),
      t({ "</>", "" }),
      t({ ");" }),
    })

    local use_state = s(
      "useState",
      fmt("const [{}, set{setter}] = useState({})", {
        i(1, "state"),
        i(2, "initialValue"),
        setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
      })
    )

    local common_snippets = { log_snippet, import_react, return_fragment, use_state }
    local filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
    -- Loop through the filetypes and add the snippets to each one
    for _, filetype in ipairs(filetypes) do
      ls.add_snippets(filetype, common_snippets)
    end
  end,
}
