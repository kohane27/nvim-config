return {
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

    -- TODO: check it out
    -- require("mini.align").setup({
    --   mappings = {
    --     start = "<leader>a",
    --     start_with_preview = "<leader>A",
    --   },
    -- })
  end,
}
