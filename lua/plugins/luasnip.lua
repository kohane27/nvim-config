return {
  "L3MON4D3/LuaSnip",
  event = "InsertCharPre",
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
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    -- local sn = ls.snippet_node
    -- local c = ls.choice_node
    -- local d = ls.dynamic_node
    -- local r = ls.restore_node

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

    -- TODO: not working
    -- only autosnippets for markdown
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" },
      callback = function()
        ls.setup({ enable_autosnippets = true })
      end,
    })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ simple snippets                                          │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = ",ty", wordTrig = true }, { t("Thank you.") }),
      s({ trig = ",yt", wordTrig = true }, { t("YouTube") }),
      s({ trig = ",hi", wordTrig = true }, { t("Hello! Hope you're doing well. Thank you for getting back ") }),
      s({ trig = ",input", wordTrig = true }, { t("Any input is much appreciated. Thank you.") }),
      s({ trig = ",gb", wordTrig = true }, { t("Thank you for getting back to me. I really appreciate it.") }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ multi-line snippets                                      │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = "```", wordTrig = true }, {
        t({ "```bash", "" }),
        i(0),
        t({ "", "" }),
      }),

      s({ trig = ",f", wordTrig = true }, {
        t({ "", "I have the following:" }),
        -- Linebreak
        t({ "", "" }),
        t({ "", "" }),
        t({ "```bash", "" }),
        i(0),
        t({ "", "" }),
        t({ "```", "" }),
      }),

      s({ trig = ",u", wordTrig = true }, {
        t({ "I'm using `" }),
        i(1),
        t({ "`. I have the following:", "" }),
        t({ "", "" }),
        t({ "```bash", "" }),
        i(2),
        t({ "", "" }),
        t({ "```", "" }),
        t({ "", "" }),
        i(3),
      }),

      s({ trig = ",diff", wordTrig = true }, {
        t({ "What is the difference between `" }),
        i(1),
        t({ "` and `" }),
        i(2),
        t({ "`?" }),
      }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Functions                                                │
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
    -- TODO:
    -- "useState": {
    --     "prefix": "us",
    --     "body": "const [${1:setterName}, set${1/(.*)/${1:/capitalize}/}] = useState(${2:defVal});$0",
    --     "description": "useState with proper camel casing."
    -- }
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

    -- TODO: from ofseed/lua/snippets/javascriptreact.lua
    -- local useState = s(
    --   {
    --     trig = "useState",
    --     dsrc = "const [state, setState] = useState()",
    --   },
    --   fmta([[const [<state>, set<State>] = useState(<ends>)]], {
    --     state = i(1),
    --     State = d(2, insert_capitalize, 1),
    --     ends = i(0),
    --   })
    -- )

    ls.add_snippets("javascript", { log_snippet, import_react })
    ls.add_snippets("typescript", { log_snippet, import_react })
    ls.add_snippets("javascriptreact", { log_snippet, import_react, return_fragment })
    ls.add_snippets("typescriptreact", { log_snippet, import_react, return_fragment })
  end,
}
