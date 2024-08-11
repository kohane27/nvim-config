return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    default_mappings = false,
    mappings = {
      set_next = "",
      next = "",
      prev = "",
      delete_line = "mx",
      delete_buf = "mX",
    },
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
  },
  init = function()
    -- disable distracting highlights
    vim.cmd([[
    highlight MarkSignHL guibg=NONE guifg=NONE
    highlight MarkSignNumHL guibg=NONE guifg=NONE
    highlight MarkVirtTextHL guibg=NONE guifg=NONE
    ]])
  end,
}
