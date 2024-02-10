-- TODO: learn to use it properly
-- TODO: add GitConflictListQf
-- NOTE: source code changed
-- local DEFAULT_ANCESTOR_BG_COLOR = 2244681 -- #223249 (waveBlue1)
return {
  "akinsho/git-conflict.nvim",
  config = function()
    require("git-conflict").setup({
      disable_diagnostics = true,
    })
  end,
}
