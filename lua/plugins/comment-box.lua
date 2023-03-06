local status_ok, comment_box = pcall(require, "comment-box")
if not status_ok then
  print("comment-box not working")
end

comment_box.setup({})
