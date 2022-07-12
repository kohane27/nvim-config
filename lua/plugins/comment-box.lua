local status_ok, comment_box = pcall(require, "comment-box")
if not status_ok then
  return
end

comment_box.setup({})

-- left aligned fixed size box with left aligned text
vim.api.nvim_set_keymap(
  "v",
  "<leader>mb",
  "<cmd>lua require('comment-box').lbox()<cr>",
  { noremap = true, silent = true }
)
