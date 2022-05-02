local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
	print("better_escape failing")
end

better_escape.setup({})
