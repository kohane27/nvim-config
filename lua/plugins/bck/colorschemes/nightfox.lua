local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  print("nightfox not working")
end

nightfox.setup({
  groups = {
    all = {
      Visual = { bg = "#6183bb" }, -- Visual mode selection
    },
  },
  options = {
    dim_inactive = false,
    styles = {
      comments = "italic",
      conditionals = "NONE",
      constants = "bold",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
  },
})
