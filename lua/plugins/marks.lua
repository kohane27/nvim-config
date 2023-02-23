local status_ok, marks = pcall(require, "marks")
if not status_ok then
  print("marks not working")
end

marks.setup({
  default_mappings = false,
  mappings = {
    set_next = "mm",
    next = "mj",
    prev = "mk",
    delete_line = "mx",
    delete_buf = "mX",
  },
  -- delete marks upon `BufRead`
  force_write_shada = true,
  -- builtin marks to show
  builtin_marks = { ".", "'", "^" },
  -- . last change
  -- ^ last Insert mode
  -- whether cycle back to the beginning/end of buffer
  cyclic = false,
  -- Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "",
    -- prompt for a virtual line annotation when setting a bookmark
    annotate = false,
  },
})