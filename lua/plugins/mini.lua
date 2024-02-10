return {
  -- TODO: try other mini modules
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })

    require("mini.misc").setup({
      -- restore cursor position on file reopen
      require("mini.misc").setup_restore_cursor(),
      -- automated change of current directory
      require("mini.misc").setup_auto_root(),
    })

    require("mini.trailspace").setup()

    require("mini.indentscope").setup({
      symbol = "▏",
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
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

    -- TODO: check it
    -- require("mini.align").setup({
    --   mappings = {
    --     start = "<leader>a",
    --     start_with_preview = "<leader>A",
    --   },
    -- })
  end,
}
