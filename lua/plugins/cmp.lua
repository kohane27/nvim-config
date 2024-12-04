return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  -- TODO: check out https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completion capabilities
    "hrsh7th/cmp-buffer", -- words in all opened buffers
    "hrsh7th/cmp-path", -- filepath
    "hrsh7th/cmp-cmdline", -- source for vim's cmdline
    "onsails/lspkind.nvim", -- pictograms
    "lukas-reineke/cmp-rg", -- search all files in project
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- 'text', 'text_symbol', 'symbol_text', 'symbol'
          maxwidth = { menu = 50, abbr = 50 },
          ellipsis_char = "...",
          show_labelDetails = true, -- show labelDetails in menu
          symbol_map = { gemini = "" },
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            rg = "[rg]",
            luasnip = "[luasnip]",
            minuet = "[AI]",
            path = "[path]",
            nvim_lsp_signature_help = "[Help]",
          },
        }),
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-e>"] = cmp.mapping.complete(),
        ["<C-e>"] = require("minuet").make_cmp_map(),
        ["<C-Space>"] = cmp.config.disable,
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- https://github.com/milanglacier/minuet-ai.nvim?tab=readme-ov-file#significant-input-delay-when-moving-to-a-new-line
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.core.view:visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end),

        -- Tab for `luasnip`
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = {
        { name = "luasnip" },
        -- { name = "minuet" },

        {
          name = "nvim_lsp",
          -- remove snippets from LSP
          entry_filter = function(entry)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
        { name = "rg", option = { debounce = 500 } },
        {
          name = "buffer",
          option = {
            -- complete from all open buffers
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },

        -- filesystem paths
        { name = "path" },

        -- display function signatures with the current parameter emphasized
        { name = "nvim_lsp_signature_help" },
      },
      performance = {
        -- slower response speed of LLMs
        fetching_timeout = 2000,
      },
    })

    -- `/` cmdline
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` cmdline
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}
