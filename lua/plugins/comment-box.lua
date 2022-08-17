local status_ok, comment_box = pcall(require, "comment-box")
if not status_ok then
  return
end

comment_box.setup({})
