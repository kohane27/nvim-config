local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  print("todo-comments not working")
end

todo_comments.setup({})
