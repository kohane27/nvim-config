return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    aliases = {
      ["("] = ")",
      ["{"] = "}",
      ["["] = "]",
      ["<"] = ">",
      ["S"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    keymaps = {
      insert = false,
      insert_line = false,
      normal = "S",
      normal_cur = "SS",
      normal_line = false,
      normal_cur_line = false,
      visual = "S",
      visual_line = false,
      delete = "dS",
      change = "cS",
      change_line = false,
    },
  },
}
