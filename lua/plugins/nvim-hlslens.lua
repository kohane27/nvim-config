return {
  -- better search results
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  opts = {
    calm_down = true, -- clear all lens and highlighting when the cursor moves out of position range
    nearest_only = true,
  },
  config = function(_, opts)
    require("hlslens").setup(opts)

    local map = require("core.utils").map

    map("n", "n", "<cmd>execute('normal! ' . v:count1 . 'n')<CR><cmd>lua require('hlslens').start()<CR>zz")
    map("n", "N", "<cmd>execute('normal! ' . v:count1 . 'N')<CR><cmd>lua require('hlslens').start()<CR>zz")

    map("n", "*", "*<cmd>lua require('hlslens').start()<CR>zz")
    map("n", "#", "#<cmd>lua require('hlslens').start()<CR>zz")
  end,
}
