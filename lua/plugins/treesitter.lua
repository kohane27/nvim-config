local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts_configs.setup({
  ensure_installed = "all",
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "yaml", "json" },
    additional_vim_regex_highlighting = { "markdown" }, -- false and gx won't work
  },
  autotag = { enable = true }, -- windwp/nvim-ts-autotag
  autopairs = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "yaml", "json" } },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    -- disable = { "jsx", "cpp" }, list of languages
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- termcolors = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#88c0d0", "#5e81ac", "#b48ead" }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  refactor = {
    highlight_current_scope = { enable = true },
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = false,
    },
    move = {
      enable = true,
      set_jumps = true, -- set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
      disable = { "c", "ruby" }, -- optional
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
