local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
  print("obsidian not working")
end

obsidian.setup({
  dir = "~/Documents/Obsidian/SecondBrain/",
  completion = {
    nvim_cmp = true,
  },
  note_frontmatter_func = function(note)
    local out = { id = note.id, tags = note.tags }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,
})

vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
