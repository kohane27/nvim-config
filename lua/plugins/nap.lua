local status_ok, nap = pcall(require, "nap")
if not status_ok then
  print("nap not working")
end

nap.setup({
  next_prefix = "]",
  prev_prefix = "[",
  next_repeat = ",",
  prev_repeat = ";",
  operators = {
    ["d"] = {
      next = { rhs = "<cmd>Lspsaga diagnostic_jump_next<CR>", opts = { desc = "Next diagnostic" } },
      prev = { rhs = "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts = { desc = "Prev diagnostic" } },
      mode = { "n", "v", "o" },
    },
    ["e"] = {
      next = { rhs = "g;zz", opts = { desc = "Older edit (change-list) item" } },
      prev = { rhs = "g,zz", opts = { desc = "Newer edit (change-list) item" } },
    },
    ["l"] = {
      next = { rhs = "<cmd>lnext<cr>", opts = { desc = "Next loclist item" } },
      prev = { rhs = "<cmd>lprevious<cr>", opts = { desc = "Prev loclist item" } },
    },
    ["L"] = {
      next = { rhs = "<cmd>llast<cr>", opts = { desc = "Last loclist item" } },
      prev = { rhs = "<cmd>lfirst<cr>", opts = { desc = "First loclist item" } },
    },
    ["q"] = {
      next = { rhs = "<cmd>cnext<cr>zz", opts = { desc = "Next quickfix item" } },
      prev = { rhs = "<cmd>cprevious<cr>zz", opts = { desc = "Prev quickfix item" } },
    },
    ["Q"] = {
      next = { rhs = "<cmd>clast<cr>", opts = { desc = "Last quickfix item" } },
      prev = { rhs = "<cmd>cfirst<cr>", opts = { desc = "First quickfix item" } },
    },
    ["z"] = {
      next = { rhs = "zj", opts = { desc = "Next fold" } },
      prev = { rhs = "zk", opts = { desc = "Prev fold" } },
      mode = { "n", "v", "o" },
    },
  },
})

nap.map("a", false)
nap.map("A", false)
nap.map("b", false)
nap.map("B", false)
nap.map("f", false)
nap.map("F", false)
nap.map("t", false)
nap.map("T", false)
nap.map("<C-t>", false)
nap.map("s", false)
nap.map("<C-l>", false)
nap.map("<M-l>", false)
nap.map("<C-q>", false)
nap.map("<M-q>", false)
nap.map("'", false)
