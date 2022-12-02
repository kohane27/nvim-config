local status_ok, better_comment = pcall(require, "better-comment")
if not status_ok then
  return
end

better_comment.Setup()
