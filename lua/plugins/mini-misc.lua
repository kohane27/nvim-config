return {
  "echasnovski/mini.misc",
  version = false,
  lazy = false,
  config = function()
    require("mini.misc").setup({
      -- restore cursor position on file reopen
      require("mini.misc").setup_restore_cursor(),

      -- automated change of current directory
      require("mini.misc").setup_auto_root(),
    })
  end,
}
