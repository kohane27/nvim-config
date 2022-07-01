local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup({
  pre_hook = function(info)
    if info == "setmark" then
      vim.cmd("normal m'")
    end
  end,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "200", "quadratic", [['setmark']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "200", "quadratic", [['setmark']] } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['setmark']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['setmark']] } }
t["zt"] = { "zt", { "200" } }
t["zz"] = { "zz", { "200" } }
t["zb"] = { "zb", { "200" } }

require("neoscroll.config").set_mappings(t)
