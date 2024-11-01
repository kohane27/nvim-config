vim.filetype.add({
  extension = {
    ["snap"] = function(path, bufnr)
      if path:match("%.tsx%.snap$") then
        return "typescript"
      end
    end,
  },
})
