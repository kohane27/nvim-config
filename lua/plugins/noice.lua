return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- TODO: not working
    local message_filters = {
      -- Filter for "X lines yanked" messages
      {
        event = "msg_show",
        pattern = "%d+ lines yanked",
        hide = true,
      },
      -- Filter for "X more lines" messages
      {
        event = "msg_show",
        pattern = "%d+ more lines",
        hide = true,
      },
      -- Filter for "X lines less; before #Y  Z seconds ago" messages
      {
        event = "msg_show",
        pattern = "%d+ line[s]? less; before #%d+%s+%d+ seconds ago",
        hide = true,
      },
      -- Filter for "filename  X lines, Y bytes written" messages
      {
        event = "msg_show",
        pattern = ".+ %d+L, %d+B written$",
        hide = true,
      },
    }
    require("noice").setup({
      filter = message_filters,
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
        command_palette = false, -- cmdline not at the top
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    })
  end,
}
