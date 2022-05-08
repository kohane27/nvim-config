local status_ok, Comment = pcall(require, "Comment")
if not status_ok then
	return
end

Comment.setup()
