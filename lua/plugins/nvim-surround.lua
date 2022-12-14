local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  print("nvim-surround not working")
end

nvim_surround.setup({
  -- no space around surrounding
  surrounds = {
    ["("] = { add = { "(", ")" } },
    ["{"] = { add = { "{", "}" } },
    ["<"] = { add = { "<", ">" } },
    ["["] = { add = { "[", "]" } },
  },
})
