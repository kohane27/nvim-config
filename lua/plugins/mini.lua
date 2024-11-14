return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup({})

    require("mini.misc").setup({
      -- restore cursor position on file reopen
      require("mini.misc").setup_restore_cursor(),
      -- automated change of current directory
      require("mini.misc").setup_auto_root(),
    })

    require("mini.trailspace").setup({})

    require("mini.indentscope").setup({
      symbol = "▏",
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        -- Whether to first check input line to be a border of adjacent scope.
        -- cursor on function header to get scope of its body.
        try_as_border = true,
      },

      mappings = {
        -- Textobjects (`''` to disable)
        object_scope = "ii",
        object_scope_with_border = "ai",

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = "",
        goto_bottom = "",
      },
    })

    require("mini.ai").setup({
      mappings = {
        -- Main textobject prefixes
        around = "a",
        inside = "i",

        -- `""` to disable
        goto_left = "",
        goto_right = "",
      },

      -- Number of lines within which textobject is searched
      n_lines = 1,

      -- Whether to disable showing non-error feedback
      silent = true,
    })

    require("mini.move").setup({
      -- Use `""` to disable one
      mappings = {
        -- Move visual selection in Visual mode
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",

        -- Move current line in Normal mode
        line_left = "",
        line_right = "",
        line_down = "",
        line_up = "",
      },

      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = false,
      },
    })

    require("mini.align").setup({
      mappings = {
        start = "<leader>ma",
        start_with_preview = "<leader>mA",
      },
    })

    require("mini.operators").setup({
      -- Exchange text regions
      exchange = {
        prefix = "cx",
        reindent_linewise = true,
      },

      -- Sort text
      sort = { prefix = "" },

      -- Evaluate text and replace with output
      evaluate = { prefix = "" },

      -- Replace text with register
      replace = { prefix = "" },

      -- Multiply (duplicate) text
      multiply = { prefix = "" },
    })
  end,
}
