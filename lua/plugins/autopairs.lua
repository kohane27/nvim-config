local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("nvim-autopairs not working")
end

npairs.setup({
  map_c_h = true, -- map <C-h> key to delete a pair
  map_c_w = true, -- map <C-w> to delete a pair
})

-- add parentheses after selecting function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

