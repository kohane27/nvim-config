local status_ok, tabout = pcall(require, "tabout")
if not status_ok then
  return
end

tabout.setup({
  tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  enable_backwards = true, -- disable if you just want to move forward
  completion = true, -- if the tabkey is used in a completion pum
  ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  exclude = {}, -- tabout will ignore these filetypes
})
