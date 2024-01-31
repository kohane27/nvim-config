return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  opts = {
    is_block_ui_break = true, -- mapping backspace and enter key to avoid ui break
    mapping = {
      ["send_to_qf"] = {
        map = "<C-c>",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
      ["run_current_replace"] = {
        map = "<leader>r",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
    },
  },
  config = function(_, opts)
    require("spectre").setup(opts)
  end,
}
