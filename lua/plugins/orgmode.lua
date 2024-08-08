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
}
