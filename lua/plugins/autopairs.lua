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

-- -- add spaces between parentheses
-- -- | Before | Insert  |  After   |
-- -- |--------|---------|----------|
-- -- | `(|)`  | `space` | `( | )`  |
-- -- | `( | )`| `)`     | `(  )|`  |
-- local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
-- local Rule = require("nvim-autopairs.rule")
-- npairs.add_rules({
--   Rule(" ", " "):with_pair(function(opts)
--     local pair = opts.line:sub(opts.col - 1, opts.col)
--     return vim.tbl_contains({
--       brackets[1][1] .. brackets[1][2],
--       brackets[2][1] .. brackets[2][2],
--       brackets[3][1] .. brackets[3][2],
--     }, pair)
--   end),
-- })
-- for _, bracket in pairs(brackets) do
--   npairs.add_rules({
--     Rule(bracket[1] .. " ", " " .. bracket[2])
--       :with_pair(function()
--         return false
--       end)
--       :with_move(function(opts)
--         return opts.prev_char:match(".%" .. bracket[2]) ~= nil
--       end)
--       :use_key(bracket[2]),
--   })
-- end
