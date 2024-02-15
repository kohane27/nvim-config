return {
  -- `<C-w>o` maximizes window without closing other buffers
  "nyngwang/NeoZoom.lua",
  event = "VeryLazy",
  opts = {
    popup = { enabled = true },
    exclude_filetypes = { "lspinfo", "mason", "lazy", "fzf", "qf", "terminal", "dashboard", "spectre-panel" },
    winopts = {
      offset = {
        -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
        -- top = 0,
        -- left = 0.17,
        width = 150,
        height = 0.80,
      },
      -- NOTE: check :help nvim_open_win() for possible border values.
      border = "thicc", -- this is a preset, try it :)
    },
    presets = {
      {
        -- NOTE: regex pattern can be used here!
        filetypes = { "dapui_.*", "dap-repl" },
        winopts = {
          offset = { top = 0.02, left = 0.26, width = 0.74, height = 0.25 },
        },
      },
      {
        filetypes = { "markdown" },
        callbacks = {
          function()
            vim.wo.wrap = true
          end,
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-zoom").setup(opts)
  end,
}
