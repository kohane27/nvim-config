return {
  "LintaoAmons/scratch.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    scratch_file_dir = os.getenv("HOME") .. "/Cloud/laptop/nvim/local/share/scratch.nvim",
    filetypes = { "md", "json", "js", "ts", "java", "py", "lua", "sh" },
    window_cmd = "vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
    file_picker = "telescope",
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
