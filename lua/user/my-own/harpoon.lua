local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--mark files you want to revisit later on
--map('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
