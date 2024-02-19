return {
  "kylechui/nvim-surround",
  dependencies = {
    -- `mini.ai` fixed https://github.com/kylechui/nvim-surround/issues/153
  },
  event = "VeryLazy",
  opts = {
    surrounds = {
      ["("] = false,
      ["{"] = false,
      ["["] = false,
      ["<"] = false,
    },
    aliases = {
      ["("] = ")",
      ["{"] = "}",
      ["["] = "]",
      ["<"] = ">",
    },
    keymaps = {
      insert = false,
      insert_line = false,
      normal = "ys",
      normal_cur = "yss",
      normal_line = false,
      normal_cur_line = false,
      visual = "S",
      visual_line = false,
      delete = "ds",
      change = "cs",
    },
  },
  config = function(_, opts)
    require("nvim-surround").setup(opts)
    vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal)$")
  end,
}
