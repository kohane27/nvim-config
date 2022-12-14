local status_ok, cutlass = pcall(require, "cutlass")
if not status_ok then
  print("cutlass not working")
end

cutlass.setup({
  -- leap.nvim integration
  -- `nc` needed for `nvim-surround`'s `css` to work
  exclude = { "ns", "nS", "nd", "xd", "vd", "nD", "nc" },
})
