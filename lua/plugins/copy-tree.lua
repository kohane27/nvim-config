return {
  "AdiY00/copy-tree.nvim",
  cmd = { "CopyTree", "SaveTree" },
  opts = {
    additional_extensions = { "%.tf$" },
    exclude_extensions = { "%.md$", "%.json$", "%.min.js$" },
    ignore_dirs = { "^%.", "node_modules", "dist", "undo", "__pycache__" },
  },
}
