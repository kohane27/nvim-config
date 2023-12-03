local status_ok, hydra = pcall(require, "hydra")
if not status_ok then
  print("hydra not working")
end

hydra({
  name = "Resize Window",
  mode = "n",
  body = "<C-w>",
  config = {
    -- color = "pink",
  },
  heads = {
    -- resize window
    { "h", '<cmd>lua require("tmux").resize_left()<cr>' },
    { "l", '<cmd>lua require("tmux").resize_right()<cr>' },
    { "j", '<cmd>lua require("tmux").resize_bottom()<cr>' },
    { "k", '<cmd>lua require("tmux").resize_top()<cr>' },

    -- equalize window sizes
    { "e", "<C-w>=" },

    -- exit this Hydra
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

-- BELOW from nap.nvim

hydra({
  name = "Hunk",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rh",
  heads = {
    { "j", "<cmd>Gitsigns prev_hunk<CR>" },
    { "k", "<cmd>Gitsigns next_hunk<CR>" },
  },
})

hydra({
  name = "Diagnostics",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rd",
  heads = {
    { "j", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
    { "k", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
  },
})

hydra({
  name = "Grapple",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rg",
  heads = {
    { "j", '<cmd>lua require("grapple").cycle_forward()<CR>' },
    { "k", '<cmd>lua require("grapple").cycle_backward()<CR>' },
  },
})

hydra({
  name = "TODO",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rt",
  heads = {
    { "j", '<cmd>lua require("todo-comments").jump_next()<CR>' },
    { "k", '<cmd>lua require("todo-comments").jump_prev()<CR>' },
  },
})

hydra({
  name = "changelist",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rc",
  heads = {
    { "j", "g;zz" },
    { "k", "g,zz" },
  },
})

hydra({
  name = "quickfix",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rq",
  heads = {
    { "j", "<cmd>cnext<CR>zz" },
    { "k", "<cmd>cprevious<CR>zz" },
  },
})

hydra({
  name = "loclist",
  mode = "n",
  config = {
    invoke_on_body = true,
  },
  body = "rl",
  heads = {
    { "j", "<cmd>lnext<CR>" },
    { "k", "<cmd>lprevious<CR>" },
  },
})
