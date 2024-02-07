return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  opts = {
    case_sensitive = false,
    -- TODO: no `autojump`
    safe_labels = "", -- disable auto-jumping to the first match
    max_phase_one_targets = 0, -- first char won't show possible matches
    max_highlighted_traversal_targets = 10,
  },

  config = function(_, opts)
    local leap = require("leap")
    leap.setup(opts)
    leap.set_default_keymaps(true)

    -- Bidirectional search
    local function leap_current_window()
      leap.leap({ target_windows = { vim.fn.win_getid() } })
    end
    vim.keymap.set("n", "s", leap_current_window, { silent = true })
    vim.keymap.set("x", "s", leap_current_window, { silent = true })

    -- mark cursor location before jumping
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapEnter",
      callback = function()
        vim.cmd("normal m'")
      end,
    })

    -- center cursor after jumping
    vim.api.nvim_create_autocmd("User", {
      pattern = "LeapLeave",
      callback = function()
        vim.cmd("normal zz")
      end,
    })
  end,
}
