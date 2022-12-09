local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup({
  pre_hook = function(info)
    if info == "pre_hook" then
      vim.cmd("normal zz")
      vim.cmd("normal m'")
    end
  end,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<C-u>"] = { "scroll", { "-0.20", "true", "150", "quadratic", [['pre_hook']] } }
t["<C-d>"] = { "scroll", { "0.20", "true", "150", "quadratic", [['pre_hook']] } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)/2", "true", "350", "quadratic", [['pre_hook']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)/2", "true", "350", "quadratic", [['pre_hook']] } }
t["zt"] = { "zt", { "200" } }
t["zz"] = { "zz", { "200" } }
t["zb"] = { "zb", { "200" } }

require("neoscroll.config").set_mappings(t)
