return {
  "andymass/vim-matchup",
  lazy = false,
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    vim.g.matchup_matchparen_offscreen = {}
    -- fix https://github.com/andymass/vim-matchup/issues/90
    local augroup_id = vim.api.nvim_create_augroup("matchup_matchparen_highlight", { clear = true })
    local function set_highlight()
      vim.api.nvim_set_hl(0, "MatchParenCur", { bold = true })
      vim.api.nvim_set_hl(0, "MatchParen", { bold = true })
      vim.api.nvim_set_hl(0, "MatchWord", { bold = true })
    end
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = augroup_id,
      pattern = "*",
      callback = set_highlight,
    })
  end,
}
