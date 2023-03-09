local status_ok, tabout = pcall(require, "tabout")
if not status_ok then
  return
end

tabout.setup({
  tabkey = "<Tab>", -- trigger tabout, set to an empty string to disable
  backwards_tabkey = "<S-Tab>", -- trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible
  default_tab = false, -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  default_shift_tab = false, -- reverse shift default action
  enable_backwards = true,
  completion = true, -- if the tabkey is used in a completion pum
  ignore_beginning = true,
})
