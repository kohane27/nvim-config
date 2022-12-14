local status_ok, Comment = pcall(require, "Comment")
if not status_ok then
  print("Comment not working")
end

Comment.setup({})
