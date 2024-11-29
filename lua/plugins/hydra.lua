return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,

  config = function()
    local Hydra = require("hydra")
    local dap = require("dap")
    local dapui = require("dapui")
    local neotest = require("neotest")

    local default_config = {
      invoke_on_body = true,
      hint = {
        type = "window",
        position = "top-right",
        float_opts = { border = "rounded" },
        hide_on_load = false,
        show_name = false,
      },
    }

    Hydra({
      name = "Buffers",
      mode = "n",
      body = "<leader>b",
      hint = [[
 _cl_: close right
 _ch_: close left
 _co_: close others
 _ca_: close all
  _q_: close buffer
      ]],

      config = vim.tbl_extend("force", default_config, {
        color = "amaranth",
        on_key = function()
          -- redraw the screen so that it shows the changes immeidately
          vim.wait(200, function()
            vim.cmd("redraw")
          end, 30, false)
        end,
      }),
      -- stylua: ignore
      heads = {
        { "H", "<cmd>BufferLineCyclePrev<CR>" },
        { "L", "<cmd>BufferLineCycleNext<CR>" },

        { "h", "<cmd>BufferLineMovePrev<CR>", { on_key = true } },
        { "l", "<cmd>BufferLineMoveNext<CR>", { on_key = true } },

        { "<C-y>", "<Cmd>BufferLineTogglePin<CR>" },
        { "q", function() Snacks.bufdelete() end },
        { "cl", "<cmd>BufferLineCloseRight<CR>", { exit = true, nowait = true, on_key = true } },
        { "ch", "<cmd>BufferLineCloseLeft<CR>", { exit = true, nowait = true, on_key = true } },
        { "co", "<cmd>BufferLineCloseOthers<CR>", { exit = true, nowait = true, on_key = true } },
        { "ca", function() Snacks.bufdelete.all() end, { exit = true, nowait = true, on_key = true } },

        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    Neotest = Hydra({
      name = "Neotest",
      mode = "n",
      body = "<leader>mT",
      config = vim.tbl_extend("force", default_config, {
        color = "pink",
      }),
      hint = [[
_r_ "Run Nearest"
_T_ "Run all files"
_f_ "Run current file"
_d_ "Debug nearest test"
_l_ "Run Last"
_s_ "Stop"
_o_ "Show Output"
_t_ "Toggle Summary"
_O_ "Toggle Output Panel"
_w_ "Toggle Watch"
      ]],
      -- stylua: ignore
      heads = {
        { "r", function() neotest.run.run() end, },
        { "T", function() neotest.run.run(vim.uv.cwd()) end, },
        { "f", function() neotest.run.run(vim.fn.expand("%")) end, },
        { "d", function() neotest.run.run({ strategy = "dap" }) end, },
        { "s", function() neotest.run.stop() end, },
        { "l", function() neotest.run.run_last() end, },
        { "t", function() neotest.summary.toggle() end, },
        { "o", function() neotest.output.open({ enter = true, auto_close = true }) end, },
        { "O", function() neotest.output_panel.toggle() end, },
        { "w", function() neotest.watch.toggle(vim.fn.expand("%")) end, },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    -- NOTE: `Debugger` var is for `require("hydra").activate(Debugger)` in legendary.nvim
    Debugger = Hydra({
      name = "Debugger",
      mode = "n",
      body = "<leader>mD",
      config = vim.tbl_extend("force", default_config, {
        color = "pink",
        on_enter = function()
          require("dapui").toggle()
        end,
      }),
      hint = [[
 _b_: breakpoint
 _B_: breakpoint condition
 _c_: CONTINUE until next breakpoint
 _i_: step INTO function
 _o_: step OUT function
 _n_: step OVER line
 _*_: run to cursor
 _r_: restart session
 _u_: toggle UI
 _t_: terminate
       ]],
      -- stylua: ignore
      heads = {
        { "b", function() dap.toggle_breakpoint() end },
        { "B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end },
        { "c", function() dap.continue() end },
        { "i", function() dap.step_into() end },
        { "o", function() dap.step_out() end },
        { "n", function() dap.step_over() end },
        { "r", function() dap.restart() end },
        { "*", function() dap.run_to_cursor() end },
        { "t", function() dap.terminate() end },
        { "u", function() dapui.toggle() end },
        { "<Esc>", nil, { exit = true, nowait = true } },
        -- not supported by JS
        -- { "<", function() if vim.bo.filetype ~= "dap-float" then dap.step_back() end end },
      },
    })
  end,
}
