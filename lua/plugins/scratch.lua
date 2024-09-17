return {
  "LintaoAmons/scratch.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    filetypes = { "md", "json", "js", "ts", "java", "py", "lua", "sh" },
    window_cmd = "vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
    file_picker = "telescope",
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
