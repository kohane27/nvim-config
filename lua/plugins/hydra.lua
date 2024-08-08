return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",

  -- stylua: ignore
  config = function()
    local hydra = require("hydra")

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
    hydra({
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

    hydra({
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

    hydra({
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
