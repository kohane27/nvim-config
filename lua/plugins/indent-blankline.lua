local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  print("indent_blankline not working")
end

indent_blankline.setup({
  char = "▏",
  show_first_indent_level = true,
  use_treesitter = false, -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/362
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  show_trailing_blankline_indent = false,
  -- show_first_indent_level = false,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
  filetype_exclude = {
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "markdown",
    "NvimTree",
    "Trouble",
    "vim",
    "help",
    "git",
    "markdown",
    "text",
    "terminal",
    "lspinfo",
    "packer",
    "NvimTree",
  },
  buftype_exclude = {
    "terminal",
    "nofile",
  },
})
