-- indentation guides
return {
  "lukas-reineke/indent-blankline.nvim",
  commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
  event = "VeryLazy",
  opts = {
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
  },
  config = function(_, opts)
    require("indent_blankline").setup(opts)
  end,
}
