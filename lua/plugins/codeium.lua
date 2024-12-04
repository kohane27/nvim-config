return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      filetypes = {
        markdown = false,
      },
      default_filetype_enabled = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false, -- do not auto-complete automatically
        key_bindings = {
          -- Accept the current completion.
          accept = "<C-e>",
          -- Accept the next word.
          accept_word = false,
          -- Accept the next line.
          accept_line = false,
          -- Clear the virtual text.
          clear = false,
          -- Cycle to the next completion.
          next = "<M-]>",
          -- Cycle to the previous completion.
          prev = "<M-[>",
        },
      },
    })
  end,
}
