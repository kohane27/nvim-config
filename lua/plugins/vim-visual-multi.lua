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

    -- vim.api.nvim_create_augroup("VM_noice_fix", { clear = true })
    --
    -- -- Temporarily modify message display during VM operations
    -- vim.api.nvim_create_autocmd("User", {
    --   group = "VM_noice_fix",
    --   pattern = "visual_multi_start",
    --   callback = function()
    --     -- Disable noice message capturing temporarily
    --     -- noice.disable("message")
    --     vim.cmd("Noice disable")
    --   end,
    -- })
    --
    -- -- Restore settings when exiting VM
    -- vim.api.nvim_create_autocmd("User", {
    --   group = "VM_noice_fix",
    --   pattern = "visual_multi_exit",
    --   callback = function()
    --     -- noice.enable("message")
    --     vim.cmd("Noice enable")
    --   end,
    -- })
  end,
}
