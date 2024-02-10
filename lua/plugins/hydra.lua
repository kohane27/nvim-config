return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  config = function()
    local hydra = require("hydra")

    local function map(mode, lhs, rhs)
      local options = { noremap = true, silent = true }
      if opts then
        options = vim.tbl_extend("force", options)
      end
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

    SmoothScroll = hydra({
      name = "SmoothScroll",
      mode = { "n", "x" },
      heads = {
        { "d", '<cmd>lua Scroll("<C-f>", 1, 1)<CR>', { private = true } },
        { "u", '<cmd>lua Scroll("<C-b>", 1, 1)<CR>', { private = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    map("n", "<C-d>", '<cmd>lua Scroll("<C-f>", 1, 1)<CR><cmd>lua require("hydra").activate(SmoothScroll)<CR>')
    map("x", "<C-d>", '<cmd>lua Scroll("<C-f>", 1, 1)<CR><cmd>lua require("hydra").activate(SmoothScroll)<CR>')
    map("n", "<C-u>", '<cmd>lua Scroll("<C-b>", 1, 1)<CR><cmd>lua require("hydra").activate(SmoothScroll)<CR>')
    map("x", "<C-u>", '<cmd>lua Scroll("<C-b>", 1, 1)<CR><cmd>lua require("hydra").activate(SmoothScroll)<CR>')

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Functions start with ;                                   │
    --  ╰──────────────────────────────────────────────────────────╯

    hydra({
      name = "TODO",
      mode = "n",
      body = ";t",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("todo-comments").jump_next()
        end,
      },
      heads = {
        { "j", '<cmd>lua require("todo-comments").jump_next()<CR>' },
        { "k", '<cmd>lua require("todo-comments").jump_prev()<CR>' },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Hunk",
      mode = "n",
      body = ";g",
      config = {
        invoke_on_body = true,
        on_enter = function()
          vim.api.nvim_command("Gitsigns next_hunk")
        end,
      },
      heads = {
        { "j", "<cmd>Gitsigns next_hunk<CR>" },
        { "k", "<cmd>Gitsigns prev_hunk<CR>" },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Diagnostics",
      mode = "n",
      body = ";d",
      config = {
        invoke_on_body = true,
        on_enter = function()
          vim.api.nvim_command(
            "lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })"
          )
        end,
      },
      heads = {
        { "j", "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>" },
        { "k", "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>" },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "quickfix",
      mode = "n",
      body = ";q",
      config = {
        invoke_on_body = true,
        on_enter = function()
          local status, err = pcall(vim.api.nvim_command, "cnext")
          if not status then
            -- Handle the error if "cnext" failed
            print("Error executing cnext: " .. err)
          end
        end,
      },
      heads = {
        { "j", "<cmd>cnext<CR>zz" },
        { "k", "<cmd>cprevious<CR>zz" },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "changelist",
      mode = "n",
      body = ";c",
      config = {
        invoke_on_body = true,
        on_enter = function()
          -- TODO: make sure g; g, below are correct
          vim.api.nvim_command("normal! g;zz")
        end,
      },
      heads = {
        { "j", "g,zz" },
        { "k", "g;zz" },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ Code Navigation starts with ,                            │
    --  ╰──────────────────────────────────────────────────────────╯

    hydra({
      name = "Function's Start",
      mode = "n",
      body = ",f",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_start("@function.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Function's End",
      mode = "n",
      body = ",F",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_end("@function.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_end("@function.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_end("@function.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Class's Start",
      mode = "n",
      body = ",c",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_start("@class.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Class's End",
      mode = "n",
      body = ",C",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_end("@class.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_end("@class.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_end("@class.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    -- TODO: try @statement.outer

    hydra({
      name = "Block's Start",
      mode = "n",
      body = ",b",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_start("@block.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_start("@block.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })

    hydra({
      name = "Block's End",
      mode = "n",
      body = ",B",
      config = {
        invoke_on_body = true,
        on_enter = function()
          require("nvim-treesitter.textobjects.move").goto_next_end("@block.outer")
        end,
      },
      heads = {
        {
          "j",
          function()
            require("nvim-treesitter.textobjects.move").goto_next_end("@block.outer")
          end,
        },
        {
          "k",
          function()
            require("nvim-treesitter.textobjects.move").goto_previous_end("@block.outer")
          end,
        },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    })
  end,
}
