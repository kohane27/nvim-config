return {
  -- integrated with cmp and treesitter
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    check_ts = true, -- enable treesitter
    map_c_h = true, -- map <C-h> key to delete a pair
    map_c_w = true, -- map <C-w> to delete a pair
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
  end,
}
