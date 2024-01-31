-- ╭─────────────────────────────────────────────────────────╮
-- │ note-taking/task management                             │
-- ╰─────────────────────────────────────────────────────────╯
-- `mkdnflow` conflicting with `vim-wiki`
-- "jakewvincent/mkdnflow.nvim"
-- "vimwiki/vimwiki"
-- "tools-life/taskwiki"

return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = "org",
  opts = {
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
    mappings = {
      disable_all = true,
      prefix = "<leader>o",
    },
  },
  config = function(_, opts)
    require("orgmode").setup(opts)
    -- Load treesitter grammar for org
    require("orgmode").setup_ts_grammar()
  end,
}
