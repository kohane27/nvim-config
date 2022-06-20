local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end

vim.api.nvim_set_keymap("v", "<leader>rs", "<cmd>SnipRun<CR>", { noremap = true, silent = true })

-- vim.cmd([[
-- vnoremap <leader>rs <Plug>SnipRun
-- ]])

-- stylua: ignore start

sniprun.setup({
  display = {
    "Classic",                    --# display results in the command-line  area
    "Terminal",
    -- "VirtualTextOk",              --# display ok results as virtual text
    -- "VirtualTextErr",             --# display error results as virtual text
    -- "TerminalWithCode",        --# display results and code history in a vertical split
  },

  --# customize highlight groups (setting this overrides colorscheme)
  -- snipruncolors = {
  --   SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
  --   SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
  --   SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
  --   SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  -- },
})

-- stylua: ignore start
