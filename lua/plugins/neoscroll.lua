local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

neoscroll.setup({
  hide_cursor = false, -- Hide cursor while scrolling
  pre_hook = function(info)
    if info == "hook" then
      vim.cmd("normal m'")
    end
  end,
  post_hook = function(info)
    if info ~= "center" then
      return
    end

    -- The `defer_fn` is a bit of a hack.
    -- We use it so that `neoscroll.init.scroll` will be false when we call `neoscroll.zz`
    -- As long as we don't input another neoscroll mapping in the timeout,
    -- we should be able to center the cursor.
    vim.defer_fn(function()
      neoscroll.zz(100, "sine")
    end, 10)
  end,
  -- post_hook = function(info)
  --   if info == "hook" then
  --     vim.cmd("normal zz")
  --   end
  -- end,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "230", "sine", "'center'" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "230", "sine", "'center'" } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['hook']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['hook']] } }
t["zt"] = { "zt", { "200" } }
t["zz"] = { "zz", { "200" } }
t["zb"] = { "zb", { "200" } }

require("neoscroll.config").set_mappings(t)
