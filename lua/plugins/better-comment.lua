local status_ok, better_comment = pcall(require, "better-comment")
if not status_ok then
  print("better-comment not working")
end

better_comment.Setup()
