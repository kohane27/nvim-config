return {
  "andymass/vim-matchup",
  -- can't lazy load
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    vim.cmd([[
    " " don't match `()`
    " set matchpairs-=(:)
    let g:matchup_matchparen_offscreen = {}
    ]])
  end,
}
