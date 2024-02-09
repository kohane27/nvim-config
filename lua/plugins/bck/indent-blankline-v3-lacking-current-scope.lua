return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      -- indentation level where variables or functions are accessible
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "markdown",
          "NvimTree",
          "Trouble",
          "checkhealth",
          "man",
          "gitcommit",
          "vim",
          "help",
          "git",
          "TelescopeResults",
          "TelescopePrompt",
          "markdown",
          "text",
          "terminal",
          "lspinfo",
          "packer",
          "NvimTree",
        },
      },
    })
    -- replace the first indentation guide for space indentation with a normal space
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    -- replace the first indentation guide for tab indentation with lcs-tab tab fill
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
  end,
}
