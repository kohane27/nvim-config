return {
  "rebelot/kanagawa.nvim",
  lazy = false, -- load immediately when starting Neovim
  priority = 5000, -- Load the colorscheme before other non-lazy-loaded plugins
  opts = {
    compile = true, -- `:KanagawaCompile`
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    -- or else gutter color not matching
    colors = { theme = { all = { ui = { bg_gutter = "none" } } } },

    -- https://github.com/rebelot/kanagawa.nvim/issues/197
    overrides = function(colors)
      -- local theme = colors.theme
      return {
        -- make floating window same as kanagawa theme
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        -- update kanagawa to handle new treesitter highlight captures
        -- ["@comment.todo"] = { link = "@text.todo" },
        -- ["@string.regexp"] = { link = "@string.regex" },
        -- ["@variable.parameter"] = { link = "@parameter" },
        -- ["@exception"] = { link = "@exception" },
        -- ["@string.special.symbol"] = { link = "@symbol" },
        -- ["@markup.strong"] = { link = "@text.strong" },
        -- ["@markup.italic"] = { link = "@text.emphasis" },
        -- ["@markup.heading"] = { link = "@text.title" },
        -- ["@markup.raw"] = { link = "@text.literal" },
        -- ["@markup.quote"] = { link = "@text.quote" },
        -- ["@markup.math"] = { link = "@text.math" },
        -- ["@markup.environment"] = { link = "@text.environment" },
        -- ["@markup.environment.name"] = { link = "@text.environment.name" },
        -- ["@markup.link.url"] = { link = "Special" },
        ["@markup.link.label"] = { link = "Identifier" },
        -- ["@comment.note"] = { link = "@text.note" },
        -- ["@comment.warning"] = { link = "@text.warning" },
        -- ["@comment.danger"] = { link = "@text.danger" },
        -- ["@diff.plus"] = { link = "@text.diff.add" },
        -- ["@diff.minus"] = { link = "@text.diff.delete" },
      }
    end,
  },
  config = function(_, opts)
    vim.opt.laststatus = 3
    vim.opt.fillchars:append({
      horiz = "━",
      horizup = "┻",
      horizdown = "┳",
      vert = "┃",
      vertleft = "┨",
      vertright = "┣",
      verthoriz = "╋",
    })
    require("kanagawa").setup(opts)
    vim.cmd("colorscheme kanagawa")
  end,
}
