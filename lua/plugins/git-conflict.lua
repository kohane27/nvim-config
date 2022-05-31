local status_ok, git_conflict = pcall(require, "git-conflict")
if not status_ok then
  return
end

git_conflict.setup({
  default_mappings = true,
  disable_diagnostics = false, -- disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffText",
    current = "DiffAdd",
  },
})
