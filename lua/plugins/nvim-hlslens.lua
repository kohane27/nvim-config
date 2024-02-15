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
    vim.api.nvim_set_keymap(
      "n",
      "n",
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "N",
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>zz]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>zz]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "g*",
      [[g*<Cmd>lua require('hlslens').start()<CR>zz]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "g#",
      [[g#<Cmd>lua require('hlslens').start()<CR>zz]],
      { noremap = true, silent = true }
    )
  end,
}
