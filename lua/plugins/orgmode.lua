local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  print("orgmode not working")
end

-- Load treesitter grammar for org
orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = "~/orgfiles/**/*",
  org_default_notes_file = "~/orgfiles/refile.org",
})
