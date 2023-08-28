local status_ok, nap = pcall(require, "nap")
if not status_ok then
  print("nap not working")
end

nap.setup({
  next_prefix = "gj",
  prev_prefix = "gk",
  next_repeat = ",",
  prev_repeat = ";",
  operators = {
    ["d"] = {
      next = { rhs = "<cmd>Lspsaga diagnostic_jump_next<CR>", opts = { desc = "Next diagnostic" } },
      prev = { rhs = "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts = { desc = "Prev diagnostic" } },
    },
    ["g"] = {
      next = { rhs = "<cmd>Gitsigns next_hunk<CR>", opts = { desc = "git: Next Hunk" } },
      prev = { rhs = "<cmd>Gitsigns prev_hunk<CR>", opts = { desc = "git: Previous Hunk" } },
    },
    ["m"] = {
      next = { rhs = '<cmd>lua require("grapple").cycle_forward()<CR>', opts = { desc = "Grapple: Next Tag" } },
      prev = { rhs = '<cmd>lua require("grapple").cycle_backward()<CR>', opts = { desc = "Grapple: Previous Tag" } },
    },
    ["t"] = {
      next = { rhs = '<cmd>lua require("todo-comments").jump_next()<CR>', opts = { desc = "Next todo comment" } },
      prev = { rhs = '<cmd>lua require("todo-comments").jump_prev()<CR>', opts = { desc = "Previous todo comment" } },
    },
    ["e"] = {
      next = { rhs = "g,zz", opts = { desc = "Previous changelist item" } },
      prev = { rhs = "g;zz", opts = { desc = "Next changelist item" } },
    },
    ["q"] = {
      next = { rhs = "<cmd>cnext<CR>zz", opts = { desc = "Next quickfix item" } },
      prev = { rhs = "<cmd>cprevious<CR>zz", opts = { desc = "Prev quickfix item" } },
    },
    ["Q"] = {
      next = { rhs = "<cmd>clast<CR>", opts = { desc = "Last quickfix item" } },
      prev = { rhs = "<cmd>cfirst<CR>", opts = { desc = "First quickfix item" } },
    },
    ["l"] = {
      next = { rhs = "<cmd>lnext<CR>", opts = { desc = "Next loclist item" } },
      prev = { rhs = "<cmd>lprevious<CR>", opts = { desc = "Prev loclist item" } },
    },
    ["L"] = {
      next = { rhs = "<cmd>llast<CR>", opts = { desc = "Last loclist item" } },
      prev = { rhs = "<cmd>lfirst<CR>", opts = { desc = "First loclist item" } },
    },
  },
})

nap.map("a", false)
nap.map("A", false)
nap.map("b", false)
nap.map("B", false)
nap.map("f", false)
nap.map("F", false)
-- nap.map("t", false)
nap.map("T", false)
nap.map("<C-t>", false)
nap.map("s", false)
nap.map("z", false)
nap.map("<C-l>", false)
nap.map("<M-l>", false)
nap.map("<C-q>", false)
nap.map("<M-q>", false)
nap.map("'", false)
