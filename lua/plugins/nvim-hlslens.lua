return {
  -- better search results
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  opts = {
    calm_down = true, -- basically vim-cool
    nearest_only = true,
  },
  config = function(_, opts)
    require("hlslens").setup(opts)

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz", opts)
    map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz", opts)

    map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>zz", opts)
    map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>zz", opts)
  end,
}
