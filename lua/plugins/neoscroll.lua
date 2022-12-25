local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  print("neoscroll not working")
end

neoscroll.setup({
  hide_cursor = false, -- Hide cursor while scrolling
  pre_hook = function(info)
    if info == "hook" then
      vim.cmd("normal m'")
    end
  end,
  post_hook = function(info)
    if info == "hook" then
      vim.cmd("normal zz")
    end
  end,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "400", "sine", [['hook']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "400", "sine", [['hook']] } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['hook']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", "quadratic", [['hook']] } }
t["zt"] = { "zt", { "250" } }
t["zz"] = { "zz", { "250" } }
t["zb"] = { "zb", { "250" } }

require("neoscroll.config").set_mappings(t)
