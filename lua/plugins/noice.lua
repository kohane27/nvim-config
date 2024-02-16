return {
  "folke/noice.nvim",
  lazy = false, -- else flashes when opening
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("noice").setup({
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "^%d+ changes?; after #%d+" },
              { find = "^%d+ changes?; before #%d+" },
              { find = "^Hunk %d+ of %d+$" },
              { find = "^%d+ fewer lines;?" },
              { find = "^%d+ more lines?;?" },
              { find = "^%d+ line less;?" },
              { find = "^Already at newest change" },
              { kind = "wmsg" },
              { kind = "emsg", find = "E486" },
              { kind = "quickfix" },
              -- TODO: not working
              { kind = "^Exited Visual-Multi.+" },
              { kind = "^VM has started with warnings.+" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "^%d+ lines .ed %d+ times?$" },
              { find = "^%d+ lines yanked$" },
              { kind = "emsg", find = "E490" },
              { kind = "search_count" },
            },
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            any = {
              -- hydra.nvim
              { find = "SmoothScroll" },
              { find = "Diagnostics" },
              { find = "TODO" },
              { find = "changelist" },
              { find = "Hunk" },
              { find = "Block's Start" },
              { find = "Block's End" },
              { find = "Class's Start" },
              { find = "Class's End" },
              { find = "Function's Start" },
              { find = "Function's End" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "notify",
            any = {
              { find = "^No code actions available$" },
              { find = "^No information available$" },
            },
          },
          view = "mini",
        },
      },
      views = {
        -- Clean cmdline_popup + palette
        cmdline_popup = {
          position = {
            row = 10,
            col = "50%",
          },
          border = {
            style = "rounded",
            -- padding = { 2, 3 },
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
        cmdline_popupmenu = {
          relative = "editor",
          position = {
            row = 13,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "none",
            padding = { 0, 3 },
          },
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
          },
        },
        hover = {
          border = {
            style = "single",
          },
        },
        confirm = {
          border = {
            style = "single",
          },
        },
        popup = {
          border = {
            style = "single",
          },
        },
      },
      messages = { view_search = false }, -- using `nvim-hlslens`
      lsp = {
        progress = { enabled = false },
        -- override markdown rendering so that cmp and other plugins use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires `hrsh7th/nvim-cmp`
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- cmdline not at the top
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    })
  end,
}
