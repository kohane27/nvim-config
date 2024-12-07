return {
  "folke/noice.nvim",
  lazy = false, -- else flashes when opening
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { kind = "wmsg" },
            { kind = "emsg", find = "E486" },
            { kind = "quickfix" },
            { find = "^Hunk %d+ of %d+$" },
            { find = "^Already at newest change" },
            { find = "^Already at oldest change" },
            { find = "Pattern not found" },

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
          event = "msg_show",
          any = {
            { find = "lines --%d+%--" },
            { find = "%d+L, %d+B" },
            { find = "%d+L, %d+B written" },
            { find = "^%d+ changes?; after #%d+" },
            { find = "^%d+ changes?; before #%d+" },
            { find = "^%d+ lines .ed %d+ times?$" },
            { find = "^%d+ lines yanked$" },
            { find = "^%d+ lines changed$" },
            { find = "^%d+ substitutions on %d+ lines?$" },
            { find = "^%d+ fewer lines;?" },
            { find = "No lines in buffer" },
            { find = "^%d+ lines yanked into;?" },
            { find = "block of %d+ lines yanked" },
            { find = "^%d+ more lines?;?" },
            { find = "^%d+ line less;?" },
            { find = "^%d+ substitutions on %d+ lines" },
            { find = "^%d+ line changed;?" },
            { kind = "emsg", find = "E490" },
            { kind = "search_count" },
            { find = "Hop" },
            -- hop.nvim
            -- { find = "no remaining sequence starts with %w" },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          any = {
            { find = "^No code actions available$" },
            { find = "^No information available$" },
            { find = "Format request failed" },
            { find = "VM has started with warning" },
          },
        },
        view = "mini",
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline", -- `cmdline` to get a classic cmdline at the bottom
    },
    views = {
      cmdline_popupmenu = {
        relative = "editor",
        position = "auto",
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
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
}
