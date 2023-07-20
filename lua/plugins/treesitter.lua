local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("treesitter.configs not working")
end

ts_configs.setup({
  ensure_installed = "all",
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "yaml", "json" },
    additional_vim_regex_highlighting = false,
  },
  autotag = { enable = true }, -- windwp/nvim-ts-autotag
  autopairs = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "yaml", "json" } },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- set to `false` to disable one of the mappings
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = false,
      node_decremental = "<c-backspace>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- jump forward to textobj, similar to targets.vim
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    swap = {
      enable = false,
    },
    move = {
      enable = true,
      set_jumps = true, -- set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      -- a bit too much; focused on above first
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
    -- lsp_interop = {
    --   enable = true,
    --   border = "single",
    --   peek_definition_code = {
    --     ["<leader>df"] = "@function.outer",
    --     ["<leader>dF"] = "@class.outer",
    --   },
    -- },
  },
})
