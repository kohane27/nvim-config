return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,

  -- stylua: ignore
  config = function()
    local Hydra = require("hydra")
    local dap = require("dap")

    local hint = [[
         ^ ^Step^ ^ ^      ^ ^     Action
     ----^-^-^-^--^-^----  ^-^-------------------  
         ^ ^back^ ^ ^      _z_: toggle breakpoint 
         ^ ^ _K_^ ^         _Z_: Set conditional breakpoint 
     out _H_ ^ ^ _L_ into   _>_: Continue
         ^ ^ _J_ ^ ^        _X_: Terminate
         ^ ^over ^ ^      ^^_s_: open scope
                      _U_: UI toggle
                      _g?_: Hydra hint
                      _gl_: Run last configuration
                      _*_: Run to cursor

         ^ ^  _<Esc>_: Normal mode
    ]]

    DapHydra = Hydra({
      name = "DEBUG",
      mode = "n",
      body = "<leader>d",

      hint = hint,
      config = {
        color = "pink",
        desc = "Debug mode",
        invoke_on_body = true,
        on_enter = function()
          require("dapui").toggle()
        end,
        hint = {
          float_opts = {
            border = "rounded",
          },
          hide_on_load = true,
          show_name = true,
        },
      },

      heads = {
        -- { "u", function() require("dapui").toggle() end },
        { "b", function() dap.toggle_breakpoint() end },
        { "B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end },
        { "c", function() if vim.bo.filetype ~= "dap-float" then dap.continue() end end },
        { "i", function() if vim.bo.filetype ~= "dap-float" then dap.step_into() end end },
        { "o", function() if vim.bo.filetype ~= "dap-float" then dap.step_out() end end },
        { "l", function() if vim.bo.filetype ~= "dap-float" then dap.step_over() end end },
        -- { "<", function() if vim.bo.filetype ~= "dap-float" then dap.step_back() end end },
        { "x", function() dap.terminate() end },
        { "*", function() dap.run_to_cursor() end },
        { "gl",
          function()
            -- Run last: https://github.com/mfussenegger/nvim-dap/issues/1025
            local last_config = nil
            dap.listeners.after.event_initialized["store_config"] = function(session)
              last_config = session.config
            end
            if last_config then dap.run(last_config)
            else dap.continue()
            end
          end,
        },
        { "s", function() if vim.bo.filetype ~= "dap-float" then require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end end },
        { "g?", function() if DapHydra.hint.win then DapHydra.hint:close() else DapHydra.hint:show() end end },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    -- BUG: can't make it work with neoscroll
    -- MyScroll = hydra({
    --   name = "Scroll",
    --   mode = 'n',
    --   heads = {
    --     { 'j', '<C-d>', { private = true } },
    --     { 'k', '<C-u>', { private = true } },
    --     { "<Esc>", nil, { exit = true, nowait = true } },
    --   },
    -- })
    -- vim.api.nvim_set_keymap('n', '<C-d>', '<C-d><cmd>lua require("hydra").activate(MyScroll)<CR>', { silent = true, noremap = true })
    -- vim.api.nvim_set_keymap('n', '<C-u>', '<C-u><cmd>lua require("hydra").activate(MyScroll)<CR>', { silent = true, noremap = true })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Code Navigation starts with ,                            │
    --  ╰──────────────────────────────────────────────────────────╯
  -- stylua: ignore
    Hydra({
      name = "Function's Start",
      mode = "n",
      body = ",f",
      config = {
        invoke_on_body = true,
        on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer") end,
      },
      heads = {
        { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer") end },
        { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@function.outer") end },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

  -- stylua: ignore
    Hydra({
      name = "Class's Start",
      mode = "n",
      body = ",c",
      config = {
        invoke_on_body = true,
        on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer") end,
      },
      heads = {
        { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer") end },
        { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@class.outer") end },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

  -- stylua: ignore
    Hydra({
      name = "Block's Start",
      mode = "n",
      body = ",b",
      config = {
        invoke_on_body = true,
        on_enter = function() require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer") end,
      },
      heads = {
        { "j", function() require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer") end },
        { "k", function() require("nvim-treesitter.textobjects.move").goto_previous_start("@block.outer") end },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })
  end,
}
