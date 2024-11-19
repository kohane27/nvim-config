return {
  "uga-rosa/ccc.nvim",
  event = "VeryLazy",
  config = function(_, _)
    local ccc = require("ccc")
    local mapping = ccc.mapping
    ccc.setup({
      lsp = false,
      highlighter = {
        auto_enable = false,
        lsp = false,
        picker = false,
        update_insert = false,
      },
      mappings = {
        ["<CR>"] = mapping.complete,
        ["q"] = mapping.quit,

        ["l"] = mapping.increase1,
        ["h"] = mapping.decrease1,
        -- ["L"] = mapping.increase5,
        -- ["H"] = mapping.decrease5,
        ["L"] = mapping.increase10,
        ["H"] = mapping.decrease10,

        ["0"] = mapping.set0,
        ["M"] = mapping.set50,
        ["$"] = mapping.set100,
      },
    })
  end,
}
