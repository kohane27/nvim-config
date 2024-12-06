return {
  "mg979/vim-visual-multi",
  config = function()
    -- create a column of cursors from visual mode
    vim.api.nvim_set_keymap(
      "n",
      "<C-S-n>",
      ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
      { noremap = true, silent = true }
    )

    vim.cmd([[
    " all mappings disabled except <C-n> (<C-n> can't be remapped)
    let g:VM_default_mappings = 0

    " " using noice.nvim or else it'll break multi cursor red change functionality
    let g:VM_set_statusline = 1

    " disable warning
    let g:VM_show_warnings = 0

    " don't display "Exited Visual-Multi."
     let g:VM_silent_exit = 1

    " To change any mapping you must first initialize the variable:
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = "<C-n>"

    " https://github.com/mg979/vim-visual-multi/issues/172
    let g:VM_maps['I BS'] = "" " disable backspace mapping
    let g:VM_maps['I CtrlC'] = "" " disable backspace mapping
]])

    -- Create an autocommand group for VM fixes
    vim.api.nvim_create_augroup("VM_fixes", { clear = true })

    local has_noice, noice = pcall(require, "noice")
    -- Temporarily modify message display during VM operations
    vim.api.nvim_create_autocmd("User", {
      group = "VM_fixes",
      pattern = "visual_multi_start",
      callback = function()
        -- Disable noice message capturing temporarily
        if has_noice then
          vim.opt.cmdheight = 1 -- Ensure there's space for VM messages
          -- noice.disable("message")
          vim.cmd("Noice disable")
        end
      end,
    })

    -- Restore settings when exiting VM
    vim.api.nvim_create_autocmd("User", {
      group = "VM_fixes",
      pattern = "visual_multi_exit",
      callback = function()
        if has_noice then
          vim.opt.cmdheight = 0 -- Restore original cmdheight
          -- noice.enable("message")
          vim.cmd("Noice enable")
        end
      end,
    })
  end,
}
