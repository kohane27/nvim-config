local status_ok, hydra = pcall(require, "hydra")
if not status_ok then
  print("hydra not working")
end

-- 5. Text object motions          *object-motions*
-- disable `[[`?
-- add `((` for func and `[[` for class

hydra({
  name = "TODO",
  mode = "n",
  body = ";t",
  config = {
    invoke_on_body = true,
    on_enter = function()
      require("todo-comments").jump_next()
    end,
  },
  heads = {
    { "j", '<cmd>lua require("todo-comments").jump_next()<CR>' },
    { "k", '<cmd>lua require("todo-comments").jump_prev()<CR>' },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "Hunk",
  mode = "n",
  body = ";h",
  config = {
    invoke_on_body = true,
    on_enter = function()
      vim.cmd("Gitsigns next_hunk")
    end,
  },
  heads = {
    { "j", "<cmd>Gitsigns next_hunk<CR>" },
    { "k", "<cmd>Gitsigns prev_hunk<CR>" },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "Diagnostics",
  mode = "n",
  body = ";d",
  config = {
    invoke_on_body = true,
    on_enter = function()
      vim.cmd("Lspsaga diagnostic_jump_next")
    end,
  },
  heads = {
    { "j", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
    { "k", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "Grapple",
  mode = "n",
  body = ";g",
  config = {
    invoke_on_body = true,
    on_enter = function()
      -- not really good to default cycle_forward
      vim.cmd('lua require("grapple").cycle_forward()')
    end,
  },
  heads = {
    { "j", '<cmd>lua require("grapple").cycle_forward()<CR>' },
    { "k", '<cmd>lua require("grapple").cycle_backward()<CR>' },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "changelist",
  mode = "n",
  body = ";c",
  config = {
    invoke_on_body = true,
    on_enter = function()
      -- TODO: fix
      vim.cmd("Gitsigns next_hunk")
    end,
  },
  heads = {
    { "j", "g;zz" },
    { "k", "g,zz" },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "quickfix",
  mode = "n",
  body = ";q",
  config = {
    invoke_on_body = true,
    on_enter = function()
      -- TODO: fix
      vim.cmd("cnext")
    end,
  },
  heads = {
    { "j", "<cmd>cnext<CR>zz" },
    { "k", "<cmd>cprevious<CR>zz" },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})

hydra({
  name = "loclist",
  mode = "n",
  body = ";l",
  config = {
    invoke_on_body = true,
    on_enter = function()
      -- TODO: fix
      vim.cmd("Gitsigns next_hunk")
    end,
  },
  heads = {
    { "j", "<cmd>lnext<CR>" },
    { "k", "<cmd>lprevious<CR>" },
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})
