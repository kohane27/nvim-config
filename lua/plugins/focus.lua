local status_ok, focus = pcall(require, "focus")
if not status_ok then
  return
end

focus.setup({
  excluded_filetypes = {
    "toggleterm",
    "NvimTree",
    "qf",
    "help",
    "TelescopePrompt",
    "harpoon",
    "fzf",
  },
  excluded_buftypes = {
    "help",
    "prompt",
    "popup",
  },
})