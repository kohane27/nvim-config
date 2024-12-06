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
    require("luasnip").setup({
      enable_autosnippets = true,
    })

    local ls = require("luasnip")
    local s = ls.snippet
    -- local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    -- local f = ls.function_node
    -- local c = ls.choice_node
    -- local d = ls.dynamic_node
    -- local r = ls.restore_node
    local l = require("luasnip.extras").lambda
    -- local rep = require("luasnip.extras").rep
    -- local p = require("luasnip.extras").partial
    -- local m = require("luasnip.extras").match
    -- local n = require("luasnip.extras").nonempty
    -- local dl = require("luasnip.extras").dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    -- local fmta = require("luasnip.extras.fmt").fmta
    -- local types = require("luasnip.util.types")
    -- local conds = require("luasnip.extras.expand_conditions")
    local ts_utils = require("nvim-treesitter.ts_utils")

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

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ markdown text nodes                                     │
    -- │ Note: Add line break: `t({ "", "" }),`                  │
    -- ╰─────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      -- LLM
      s({ trig = ",q", wordTrig = true }, { t("Do not ask me any questions.") }),
      s({ trig = ",m", wordTrig = true }, { t("Does it mean that ") }),
      s({ trig = ",p", wordTrig = true }, { t("Could you please ") }),
      s({ trig = ",diff", wordTrig = true }, { t("What are the above differences?") }),
      s({ trig = ",f", wordTrig = true }, { t("following ") }),
      s({ trig = ",F", wordTrig = true }, {
        t({ "I have the following " }),
        i(1),
        t({ ":", "" }),
        t({ "", "" }),
        t({ "```", "" }),
        i(2),
        t({ "", "" }),
        t({ "```", "" }),
      }),

      s({ trig = ",err", wordTrig = true }, {
        t({ "The above line gives the following error:", "" }),
        t({ "", "" }),
        t({ "```", "" }),
        i(1),
        t({ "", "" }),
        t({ "```", "" }),
      }),

      s({ trig = ",cor", wordTrig = true }, {
        t({ "Is the following correct?", "" }),
        t({ "", "" }),
        i(1),
      }),

      -- general
      s({ trig = ",ty", wordTrig = true }, { t("Thank you.") }),
      s({ trig = ",hi", wordTrig = true }, { t("Hello! Hope you're doing well. Thank you for getting back ") }),
      s({ trig = ",input", wordTrig = true }, { t("Any input is much appreciated. Thank you.") }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown multi-line                                      │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = "```", wordTrig = true }, {
        i(1),
        t({ "```", "" }),
        -- t({ "", "" }),
      }),

      -- s({ trig = ",u", wordTrig = true }, {
      --   t({ "I'm using `" }),
      --   i(1),
      --   t({ "`." }),
      -- }),

      -- s({ trig = ",diff", wordTrig = true }, {
      --   t({ "What is the difference between `" }),
      --   i(1),
      --   t({ "` and `" }),
      --   i(2),
      --   t({ "` ?" }),
      -- }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown function nodes                                  │
    --  ╰──────────────────────────────────────────────────────────╯
    -- ls.add_snippets("markdown", {
    --   s({ trig = ",date", wordTrig = true }, {
    --     f(function()
    --       return os.date("%Y-%m-%d")
    --     end, {}),
    --   }),
    --   s({ trig = ",time", wordTrig = true }, {
    --     f(function()
    --       return os.date("%H:%M:%S")
    --     end, {}),
    --   }),
    --   s({ trig = ",now", wordTrig = true }, {
    --     f(function()
    --       return os.date("%Y-%m-%d-%H-%M-%S")
    --     end, {}),
    --   }),
    --   s({ trig = ",random", wordTrig = true }, {
    --     f(function()
    --       return require("core.utils").generate_random_chars()
    --     end, {}),
    --   }),
    -- }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ javascript                                               │
    --  ╰──────────────────────────────────────────────────────────╯
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

    local filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
    local common_snippets = { import_react, return_fragment, use_state }
    -- Loop through the filetypes and add the snippets to each one
    for _, filetype in ipairs(filetypes) do
      ls.add_snippets(filetype, common_snippets)
    end

    -- js autosnippets
    for _, ft in ipairs(filetypes) do
      ls.add_snippets(ft, {
        s({ trig = "log", snippetType = "autosnippet", wordTrig = false }, {
          t("console.log("),
          i(1),
          t(")"),
        }),
      }, { type = "autosnippets" })
    end
  end,
}
