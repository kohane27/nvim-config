local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup({
  hide_cursor = false, -- Hide cursor while scrolling
  post_hook = function(info)
    if info == "post_hook" then
      vim.cmd("normal zz")
      vim.cmd("normal m'")
    end
  end,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- - vim.wo.scroll
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "300", "quadratic", [['post_hook']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "300", "quadratic", [['post_hook']] } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['post_hook']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['post_hook']] } }
t["zt"] = { "zt", { "200" } }
t["zz"] = { "zz", { "200" } }
t["zb"] = { "zb", { "200" } }

require("neoscroll.config").set_mappings(t)
