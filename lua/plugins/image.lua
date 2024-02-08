return {
  "3rd/image.nvim",
  event = "VeryLazy",
  opts = {
    tmux_show_only_in_active_window = true,
    neorg = {
      enabled = false,
    },
  },
  config = function(_, opts)
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    require("image").setup(opts)
  end,
}
