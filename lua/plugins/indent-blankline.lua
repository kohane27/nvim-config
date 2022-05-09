local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print("indent_blankline failing")
end

indent_blankline.setup({
show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	show_trailing_blankline_indent = false,
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = false,
  filetype_exclude = {
	'help',
	'dashboard',
	'git',
	'markdown',
	'text',
	'terminal',
	'lspinfo',
	'packer',
	'NvimTree',
  },
  buftype_exclude = {
	'terminal',
	'nofile',
  },
})


