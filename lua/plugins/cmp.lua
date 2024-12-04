return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  -- TODO: check out https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  dependencies = {
    -- LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- pictograms
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.complete(),
        ["<C-y>"] = require("minuet").make_cmp_map(),
        ["<C-Space>"] = cmp.config.disable,
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- Tab and S-Tab for `luasnip`
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text", -- 'text', 'text_symbol', 'symbol_text', 'symbol'
          maxwidth = { menu = 50, abbr = 50 },
          ellipsis_char = "...",
          show_labelDetails = true, -- show labelDetails in menu
          symbol_map = { Codeium = "" },
        }),
      },
      sources = {
        { name = "luasnip" },
        -- { name = "minuet" },
        { name = "codeium" },
        {
          name = "nvim_lsp",
          -- remove snippets from LSP
          entry_filter = function(entry)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
        {
          name = "buffer",
          option = {
            -- complete from all open buffers
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "path" },
      },
      performance = {
        -- slower response speed of LLMs
        fetching_timeout = 2000,
      },
      -- confirm_opts = {
      --   behavior = cmp.ConfirmBehavior.Replace,
      --   select = false,
      -- },
    })
  end,
}
