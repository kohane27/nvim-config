return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<leader>MXjda", "<cmd>JdtWipeDataAndRestart<CR>",                            ft = "java", desc = "jdtls: Wipe Data and Restart" },
    { "<leader>MXjdb", "<cmd>JdtUpdateConfig<CR>",                                  ft = "java", desc = "jdtls: Update Config" },
    { "<leader>MXjdc", "<cmd>lua require'jdtls'.organize_imports()<CR>",            ft = "java", desc = "jdtls: Organize Import" },
    { "<leader>MXjdd", "<cmd>lua require('jdtls').extract_variable()<CR>",          ft = "java", desc = "jdtls: Extract Variable" },
    { "<leader>MXjde", "<cmd>lua require('jdtls').extract_variable(true)<CR>",      ft = "java", desc = "jdtls: Extract Variable" },
    { "<leader>MXjdf", "<cmd>lua require('jdtls').extract_constant()<CR>",          ft = "java", desc = "jdtls: Extract Constant" },
    { "<leader>MXjdg", "<Esc><cmd>lua require('jdtls').extract_constant(true)<CR>", ft = "java", desc = "jdtls: Extract Constant" },
    { "<leader>MXjdh", "<Esc><cmd>lua require('jdtls').extract_method(true)<CR>",   ft = "java", desc = "jdtls: Extract Method" }
  },
}
