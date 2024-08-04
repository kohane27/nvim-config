return {
  "tversteeg/registers.nvim",
  event = "VeryLazy",
  config = function()
    local registers = require("registers")
    require("registers").setup({
      -- Show a line at the bottom with registers that aren't filled
      show_empty = false,
      -- Expose :Registers
      register_user_command = false,
      -- Show a char next to the register name
      show_register_types = false,

      -- + System Clipboard
      -- " unnamed (yank, delete or change)
      -- . Last Inserted Text
      -- Show registers in this order
      show = '+.0123456789abcdefghijklmnopqrstuvwxyz',

      bind_keys = {
        normal = registers.show_window({ mode = "motion" }),
        visual = registers.show_window({ mode = "motion" }),
        insert = registers.show_window({ mode = "insert" }),

        -- apply register with a delay
        registers = registers.apply_register({ delay = 0.1 }),
        ["<CR>"] = registers.apply_register({ delay = 0.1 }),
        -- Close the registers window when pressing the Esc key
        ["<Esc>"] = registers.close_window(),
        -- Move the cursor in the registers window down when pressing <C-n>
        ["<C-n>"] = registers.move_cursor_down(),
        -- Move the cursor in the registers window up when pressing <C-p>
        ["<C-p>"] = registers.move_cursor_up(),
        -- Clear the register of the highlighted line when pressing <DeL>
        ["<Del>"] = registers.clear_highlighted_register(),
      },
      window = {
        border = "rounded",
      },
      sign_highlights = {
        -- not todo highlights group
        named = "@markup.link.label",
      },
    })
  end,
}
