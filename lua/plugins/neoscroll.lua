return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    mappings = { "<C-u>", "<C-d>", "zz" },
    hide_cursor = false,
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  },
  config = function(_, opts)
    require("neoscroll").setup(opts)

    -- local t = {}
    -- -- Syntax: t[keys] = {function, {function arguments}}
    -- t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "400", "sine", [['hook']] } }
    -- t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "400", "sine", [['hook']] } }
    -- t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350", "quadratic", [['hook']] } }
    -- t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", "quadratic", [['hook']] } }
    -- t["zt"] = { "zt", { "250" } }
    -- t["zz"] = { "zz", { "250" } }
    -- t["zb"] = { "zb", { "250" } }
    --
    -- require("neoscroll.config").set_mappings(t)
  end,
}
