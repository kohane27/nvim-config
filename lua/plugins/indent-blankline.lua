local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print("indent_blankline failing")
end

indent_blankline.setup({
	-- context is off by default
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	char = "┊",
	show_trailing_blankline_indent = false,
})
