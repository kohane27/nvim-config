local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("treesitter.configs not working")
end

-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
ts_configs.setup({
  ensure_installed = "all",
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "yaml", "json" },
    additional_vim_regex_highlighting = { "org" },
  },
  autotag = { enable = true }, -- windwp/nvim-ts-autotag
  autopairs = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "yaml", "json" } },
  incremental_selection = {
    -- using `flash.nvim`
    enable = false,
    keymaps = {
      -- set to `false` to disable one of the mappings
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = false,
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

        -- conflict with `target.nvim`
        -- ["ab"] = "@block.outer",
        -- ["ib"] = "@block.inner",

        -- using `target.nvim`
        -- ["aa"] = "@parameter.outer",
        -- ["ia"] = "@parameter.inner",
      },
    },
    swap = {
      enable = false,
    },
    move = {
      enable = false,
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
