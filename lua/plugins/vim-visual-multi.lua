return {
  "mg979/vim-visual-multi",
  init = function()
    -- NOTE: do not enable `VM_leader`
    -- vim.g.VM_leader = " "

    -- all permanent mappings disabled except <C-n> (<C-n> can't be remapped)
    vim.g.VM_default_mappings = 0

    -- using noice.nvim or else it'll break multi cursor red change functionality
    vim.g.VM_set_statusline = 1

    -- or else "Press ENTER or type command to continue"
    vim.g.VM_cmdheight = 2

    -- disable warning
    vim.g.VM_show_warnings = 0

    -- don't display "Exited Visual-Multi."
    vim.g.VM_silent_exit = 1
  end,

  config = function()
    -- create a column of cursors
    vim.api.nvim_set_keymap(
      "n",
      "<C-S-n>",
      ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
      { noremap = true, silent = true }
    )

    -- disable noice.vim when running vim-visual-multi
    vim.api.nvim_create_augroup("VM_noice_fix", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      group = "VM_noice_fix",
      pattern = "visual_multi_start",
      callback = function()
        vim.cmd("redraw")
        vim.cmd("silent! Noice disable")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      group = "VM_noice_fix",
      pattern = "visual_multi_exit",
      callback = function()
        vim.cmd("silent! Noice enable")
        vim.cmd("redraw")
      end,
    })
  end,
}
