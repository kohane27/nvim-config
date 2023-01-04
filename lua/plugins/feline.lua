local status_ok, feline = pcall(require, "feline")
if not status_ok then
  print("feline not working")
end

local kanagawa = {
  fg = "#c8d3f5",
  bg = "#1F1F28",
  bg_dark = "#222436",
  fg_dark = "#a9b1d6",
}

local provide = function(provider, fg_color, bg_color, style, left_sep, right_sep, enabled)
  provider = provider or " "
  fg_color = fg_color or "fg"
  bg_color = bg_color or "bg"
  style = style or "NONE"
  left_sep = left_sep or ""
  right_sep = right_sep or ""
  enabled = enabled or true
  return {
    provider = provider,
    hl = {
      fg = fg_color,
      bg = bg_color,
      style = style,
    },
    left_sep = left_sep,
    right_sep = right_sep,
    enabled = enabled,
  }
end

local left = {
  provide("git_branch", "#957FB8", "bg", "bold", "block", "block"),
  provide("git_diff_added", "#76946A"),
  provide("git_diff_removed", "#C34043"),
  provide("git_diff_changed", "#DCA561"),
  provide("diagnostic_errors", "#E82424"),
  provide("diagnostic_warnings", "#FF9E3B"),
  provide("diagnostic_hints", "#658594"),
  provide("diagnostic_info", "#6A9589"),
}

local right = {
  -- provide("lsp_client_names", "fg_dark", "bg", "NONE", "block", "block"),
  provide(
    { name = "file_type", opts = { filetype_icon = true, case = "titlecase" } },
    "fg_dark",
    "bg",
    "NONE",
    "block",
    "block"
  ),
  provide("position", "fg_dark", "bg", "NONE", "block", "block"),
  provide("line_percentage", "fg_dark", "bg", "NONE", "block", "block"),
}

local left_inactive = {
  provide(
    { name = "file_type", opts = { filetype_icon = true, case = "titlecase" } },
    "fg",
    "bg",
    "NONE",
    "block",
    "block"
  ),
}

local right_inactive = {
  provide("position", "fg_dark", "bg", "NONE", "block", "block"),
  provide("line_percentage", "fg_dark", "bg", "NONE", "block", "block"),
}

local components = {
  active = {
    left,
    right,
  },
  inactive = {
    left_inactive,
    right_inactive,
  },
}

feline.setup({
  components = components,
  theme = kanagawa,
})
