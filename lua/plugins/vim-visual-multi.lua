return {
  "mg979/vim-visual-multi",
  config = function()
    -- all mappings disabled except <C-n> (<C-n> can't be remapped)
    vim.g.VM_default_mappings = 0

    -- using noice.nvim or else it'll break multi cursor red change functionality
    vim.g.VM_set_statusline = 1

    -- disable warning
    vim.g.VM_show_warnings = 0

    -- don't display "Exited Visual-Multi."
    vim.g.VM_silent_exit = 1

    -- To change any mapping you must first initialize the variable:
    vim.g.VM_maps = {}
    vim.g.VM_maps["Find Under"] = "<C-n>"

    -- https://github.com/mg979/vim-visual-multi/issues/172
    -- disable backspace mapping
    vim.g.VM_maps["I BS"] = ""
    -- disable Ctrl-C mapping
    vim.g.VM_maps["I CtrlC"] = ""

    -- create a column of cursors from visual mode
    vim.api.nvim_set_keymap(
      "n",
      "<C-S-n>",
      ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
      { noremap = true, silent = true }
    )

    -- disable noice.nvim when triggering this plugin
    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_start",
      callback = function()
        vim.cmd("Noice disable")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_exit",
      callback = function()
        vim.cmd("Noice enable")
      end,
    })
  end,
}
