local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end

-- stylua: ignore start

vim.api.nvim_set_keymap("v", "<leader>rs", "<cmd>SnipRun<CR>", { noremap = true, silent = true })

-- vim.cmd([[
-- vnoremap <leader>rs :<Plug>SnipRun<CR>
-- ]])

sniprun.setup({
  display = {
    "VirtualTextOk",              --# display ok results as virtual text
    "VirtualTextErr",             --# display error results as virtual text
    -- "Classic",                    --# display results in the command-line  area
    -- "TerminalWithCode",        --# display results and code history in a vertical split
  },

  --# customize highlight groups (setting this overrides colorscheme)
  snipruncolors = {
    SniprunVirtualTextOk   =  {bg="#5ad5e0",fg="#000000",ctermbg="Cyan",cterfg="Black"},
    SniprunFloatingWinOk   =  {fg="#5ad5e0",ctermfg="Cyan"},
    SniprunVirtualTextErr  =  {bg="#7d1b1b",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
    SniprunFloatingWinErr  =  {fg="#7d1b1b",ctermfg="DarkRed"},
  },
})
-- stylua: ignore end
