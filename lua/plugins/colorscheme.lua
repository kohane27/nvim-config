-- ╭──────────────────────────────────────────────────────────╮
-- │ Color schemes configuration file                         │
-- │ See:https://github.com/brainfucksec/neovim-lua#appearance│
-- ╰──────────────────────────────────────────────────────────╯

return {
  "rebelot/kanagawa.nvim",
  lazy = false, -- load immediately when starting Neovim
  priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
  opts = {
    -- https://github.com/rebelot/kanagawa.nvim/issues/197
    overrides = function(colors)
      return {
        -- update kanagawa to handle new treesitter highlight captures
        ["@string.regexp"] = { link = "@string.regex" },
        ["@variable.parameter"] = { link = "@parameter" },
        ["@exception"] = { link = "@exception" },
        ["@string.special.symbol"] = { link = "@symbol" },
        ["@markup.strong"] = { link = "@text.strong" },
        ["@markup.italic"] = { link = "@text.emphasis" },
        ["@markup.heading"] = { link = "@text.title" },
        ["@markup.raw"] = { link = "@text.literal" },
        ["@markup.quote"] = { link = "@text.quote" },
        ["@markup.math"] = { link = "@text.math" },
        ["@markup.environment"] = { link = "@text.environment" },
        ["@markup.environment.name"] = { link = "@text.environment.name" },
        ["@markup.link.url"] = { link = "Special" },
        ["@markup.link.label"] = { link = "Identifier" },
        ["@comment.note"] = { link = "@text.note" },
        ["@comment.warning"] = { link = "@text.warning" },
        ["@comment.danger"] = { link = "@text.danger" },
        ["@diff.plus"] = { link = "@text.diff.add" },
        ["@diff.minus"] = { link = "@text.diff.delete" },
      }
    end,
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    colors = {
      theme = { all = { ui = { bg_gutter = "none" } } },
    },
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

    -- Custom diff colors
    vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
    ]])

    -- Custom border colors
    vim.cmd([[
      autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
      autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
    ]])
  end,
}