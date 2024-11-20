return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,

  -- stylua: ignore
  config = function()
    local Hydra = require("hydra")

    Hydra({
      name = "Buffers",
      mode = "n",
      body = "<leader>b",
      config = {
        color = "amaranth",
        invoke_on_body = false,
        hint = false,
        on_key = function()
          -- redraw the screen so that it shows the changes immeidately
          vim.wait(200, function()
            vim.cmd("redraw")
          end, 30, false)
        end,
      },
      heads = {
        { "H", "<cmd>BufferLineCyclePrev<CR>", { on_key = false } },
        { "L", "<cmd>BufferLineCycleNext<CR>", { on_key = false } },

        { "h", "<cmd>BufferLineMovePrev<CR>", { on_key = true } },
        { "l", "<cmd>BufferLineMoveNext<CR>", { on_key = true } },

        { "<C-y>", "<Cmd>BufferLineTogglePin<CR>" },
        { "q", function() Snacks.bufdelete() end },
        { "cl", "<cmd>BufferLineCloseRight<CR>" },
        { "ch", "<cmd>BufferLineCloseLeft<CR>" },
        { "co", "<cmd>BufferLineCloseOthers<CR>" },

        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })
  end,
}

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Navigation starts with ,                                 │
    --  ╰──────────────────────────────────────────────────────────╯
  -- stylua: ignore
    -- Hydra({
    --   name = "Function's Start",
    --   mode = "n",
    --   body = ",f",
    --   config = {
    --     invoke_on_body = true,
    --     on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer") end,
    --   },
    --   heads = {
    --     { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer") end },
    --     { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@function.outer") end },
    --     { "<Esc>", nil, { exit = true, nowait = true } },
    --   },
    -- })

  -- stylua: ignore
    -- Hydra({
    --   name = "Class's Start",
    --   mode = "n",
    --   body = ",c",
    --   config = {
    --     invoke_on_body = true,
    --     on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer") end,
    --   },
    --   heads = {
    --     { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer") end },
    --     { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@class.outer") end },
    --     { "<Esc>", nil, { exit = true, nowait = true } },
    --   },
    -- })

  -- stylua: ignore
    -- Hydra({
    --   name = "Block's Start",
    --   mode = "n",
    --   body = ",b",
    --   config = {
    --     invoke_on_body = true,
    --     on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer") end,
    --   },
    --   heads = {
    --     { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer") end },
    --     { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@block.outer") end },
    --     { "<Esc>", nil, { exit = true, nowait = true } },
    --   },
    -- })

 --    local dap = require("dap")
 --
 --    DapHydra = Hydra({
 --      name = "DEBUG",
 --      mode = "n",
 --      body = "<leader>d",
 --
 --      hint = [[
 -- _b_: breakpoint   _c_: continue
 -- _i_: step into   _o_: step out
 --    ]],
 --      config = {
 --        color = "pink",
 --        desc = "Debug mode",
 --        invoke_on_body = true,
 --        on_enter = function()
 --          require("dapui").toggle()
 --        end,
 --        hint = {
 --          float_opts = {
 --            border = "rounded",
 --          },
 --          hide_on_load = true,
 --          show_name = true,
 --        },
 --      },
 --
 --      heads = {
 --        -- { "u", function() require("dapui").toggle() end },
 --        { "b", function() dap.toggle_breakpoint() end },
 --        { "B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end },
 --        { "c", function() dap.continue() end },
 --        { "i", function() dap.step_into() end },
 --        { "o", function() dap.step_out() end },
 --        { "n", function() dap.step_over() end },
 --        -- { "<", function() if vim.bo.filetype ~= "dap-float" then dap.step_back() end end },
 --        { "x", function() dap.terminate() end },
 --        { "*", function() dap.run_to_cursor() end },
 --        { "e", function() require("dapui").eval() end},
 --        { "?", function() if DapHydra.hint.win then DapHydra.hint:close() else DapHydra.hint:show() end end },
 --        { "<Esc>", nil, { exit = true, nowait = true } },
 --      },
 --    })
