local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
  print("treesitter-context failing")
end

context.setup({
  enable = true,
  patterns = { -- Match patterns for nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to appear in the context window.
    default = {
      "class",
      "function",
      "method",
      -- These won't appear in the context
      -- 'for',
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    },
  },
})
