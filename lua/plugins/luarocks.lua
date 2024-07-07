return {
  -- required by rest.nvim
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
  },
}
