local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

nvim_surround.setup({
  -- no space around surrounding
  surrounds = {
    ["("] = { add = { "(", ")" } },
    ["{"] = { add = { "{", "}" } },
    ["<"] = { add = { "<", ">" } },
    ["["] = { add = { "[", "]" } },
  },
  -- TODO b doesn't really work
  aliases = {
    ["b"] = { ")", "]", "}", ">" },
    ["B"] = "}",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
  },
})
