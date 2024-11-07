return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.5 * 1024 * 1024, -- 1.5MB
      setup = function(ctx)
        vim.b.minianimate_disable = true
        require("illuminate").pause_buf()
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ctx.ft
        end)
      end,
    },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
