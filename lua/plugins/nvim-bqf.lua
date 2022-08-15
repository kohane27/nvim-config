-- https://github.com/mhinz/vim-grepper
vim.g.grepper = { tools = { "rg", "grep" }, searchreg = 1 }
vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

require("bqf").setup({
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      elseif bufname:match("^fugitive://") then
        -- skip fugitive buffer
        ret = false
      end
      return ret
    end,
  },
  -- make `drop` and `tab drop` to become preferred
  func_map = {
    drop = "o",
    openc = "O",
    split = "<C-s>",
    tabdrop = "<C-t>",
    tabc = "",
    ptogglemode = "z,",
  },
  filter = {
    fzf = {
      action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
      extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
    },
  },
})
