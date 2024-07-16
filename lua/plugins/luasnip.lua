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

    local function get_current_function_name()
      local current_node = ts_utils.get_node_at_cursor()
      if not current_node then
        return nil
      end

      local function_node = nil
      while current_node do
        if
          current_node:type() == "function_declaration"
          or current_node:type() == "arrow_function"
          or current_node:type() == "function"
          or current_node:type() == "method_definition"
        then
          function_node = current_node
          break
        end
        current_node = current_node:parent()
      end

      if not function_node then
        return nil
      end

      local function_name = nil
      for child, _ in function_node:iter_children() do
        if child:type() == "identifier" or child:type() == "property_identifier" then
          function_name = vim.treesitter.get_node_text(child, 0)
          break
        end
      end

      -- Handle anonymous functions
      if not function_name then
        local parent = function_node:parent()
        if parent and parent:type() == "variable_declarator" then
          for child, _ in parent:iter_children() do
            if child:type() == "identifier" then
              function_name = vim.treesitter.get_node_text(child, 0)
              break
            end
          end
        elseif parent and parent:type() == "pair" then
          for child, _ in parent:iter_children() do
            if child:type() == "property_identifier" then
              function_name = vim.treesitter.get_node_text(child, 0)
              break
            end
          end
        end
      end

      return function_name or "anonymous"
    end

    -- only autosnippets for markdown
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" },
      callback = function()
        ls.setup({ enable_autosnippets = true })
      end,
    })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown text nodes                                      │
    --  ╰──────────────────────────────────────────────────────────╯
    ls.add_snippets("markdown", {
      s({ trig = ",f", wordTrig = true }, { t("following ") }),
      s({ trig = ",ty", wordTrig = true }, { t("Thank you.") }),
      s({ trig = ",todo", wordTrig = true }, { t("Complete the TODO comment in the code please.") }),
      s({ trig = ",hi", wordTrig = true }, { t("Hello! Hope you're doing well. Thank you for getting back ") }),
      s({ trig = ",input", wordTrig = true }, { t("Any input is much appreciated. Thank you.") }),
      s({ trig = ",gb", wordTrig = true }, { t("Thank you for getting back to me. I really appreciate it.") }),
      s({ trig = ",yt", wordTrig = true }, { t("YouTube") }),
      s({ trig = ",arch", wordTrig = true }, { t("I'm running ArchLinux.") }),
    }, { type = "autosnippets" })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ markdown multi-line                                      │
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
    local log_snippet = s({ trig = "log", wordTrig = true }, {
      f(function()
        local func_name = get_current_function_name()
        return string.format('console.log("🔥 %s: ", ', func_name)
      end),
      i(1),
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
