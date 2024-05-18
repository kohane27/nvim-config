return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  opts = {
    keys = "sfnjklhodweimbuyvrgtaqpcxz",
    create_hl_autocmd = false,
  },
  config = function(_, opts)
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection

    vim.keymap.set("", "f", function()
      hop.hint_char2({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        jump_on_sole_occurrence = false,
      })
    end, { remap = true })

    vim.keymap.set("", "F", function()
      hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        jump_on_sole_occurrence = false,
      })
    end, { remap = true })

    vim.keymap.set("", "t", function()
      hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        jump_on_sole_occurrence = false,
        hint_offset = -1,
      })
    end, { remap = true })

    vim.keymap.set("", "T", function()
      hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        jump_on_sole_occurrence = false,
        hint_offset = 1,
      })
    end, { remap = true })

    vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#000000", bg = "#CCFF88", bold = true })
    vim.api.nvim_set_hl(0, "HopUnmatched", { sp = "#666666" })

    hop.setup(opts)
  end,
}
