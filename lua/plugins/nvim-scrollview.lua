local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
  print("scrollview not working")
end

scrollview.setup({
  on_startup = false,
  auto_mouse = true,
  winblend = 0,
  current_only = true,
  excluded_filetypes = { "nerdtree", "nvim-tree" },
})

vim.cmd([[highlight ScrollView cterm=reverse gui=bold,underline guifg=#ebcb8b guibg=#4c566a]])
