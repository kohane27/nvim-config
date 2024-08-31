return {
  "LintaoAmons/scratch.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim",
    filetypes = { "md", "json", "js", "ts", "java", "py", "lua", "sh" },
    window_cmd = "vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
    use_telescope = true,
    -- localKeys = {
    --   {
    --     filenameContains = { "sh" },
    --     LocalKeys = {
    --       {
    --         cmd = "<CMD>RunShellCurrentLine<CR>",
    --         key = "<C-r>",
    --         modes = { "n", "i", "v" },
    --       },
    --     },
    --   },
    -- },
  },
}
