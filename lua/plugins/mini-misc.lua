local status_ok, misc = pcall(require, "mini.misc")
if not status_ok then
  print("misc not working")
end

misc.setup({
  -- restore cursor position on file reopen
  require("mini.misc").setup_restore_cursor(),

  -- automated change of current directory
  require("mini.misc").setup_auto_root(),
})
