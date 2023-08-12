local status_ok, ai = pcall(require, "mini.ai")
if not status_ok then
  print("mini.ai not working")
end

ai.setup({
  mappings = {
    -- Main textobject prefixes
    around = "a",
    inside = "i",

    -- Next/last variants
    around_next = "an",
    inside_next = "in",
    around_last = "",
    inside_last = "",

    -- Move cursor to corresponding edge of `a` textobject
    goto_left = "",
    goto_right = "",

    -- Number of lines within which textobject is searched
    n_lines = 1,

    -- How to search for object (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
    search_method = "cover",

    -- Whether to disable showing non-error feedback
    silent = true,
  },
})
