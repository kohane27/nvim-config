local status_ok, clue = pcall(require, "mini.clue")
if not status_ok then
  print("clue not working")
end

clue.setup({
  triggers = {
    { mode = "n", keys = "<C-w>" },
  },
  clues = {
    { mode = "n", keys = "<C-w>", postkeys = "<" },
    { mode = "n", keys = ">", postkeys = "<C-w>>" },
  },
})
-- require("mini.clue").setup({
--   triggers = {
--     { mode = "n", keys = "]" },
--     { mode = "n", keys = "[" },
--   },
--   clues = {
--     { mode = "n", keys = "]b", postkeys = "]" },
--     { mode = "n", keys = "]w", postkeys = "]" },
--
--     { mode = "n", keys = "[b", postkeys = "[" },
--     { mode = "n", keys = "[w", postkeys = "[" },
--   },
-- })
