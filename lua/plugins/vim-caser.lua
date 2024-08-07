return {
  "arthurxavierx/vim-caser",
  event = "VeryLazy",
  init = function()
    vim.g.caser_no_mappings = 1
    vim.g.caser_prefix = ""
  end,
  -- stylua: ignore
  keys = {
    { "<leader>MXcaa", "<Plug>CaserVUpperCase",      mode = 'v', desc = "Constant case: LOREM_IPSUM" },
    { "<leader>MXcab", "<Plug>CaserVSnakeCase",      mode = 'v', desc = "Snake case: lorem_ipsum" },
    { "<leader>MXcac", "<Plug>CaserVKebabCase",      mode = 'v', desc = "Dash case: lorem-ipsum" },
    { "<leader>MXcad", "<Plug>CaserVSpaceCase",      mode = 'v', desc = "space case: lorem ipsum" },
    { "<leader>MXcae", "<Plug>CaserVDotCase",        mode = 'v', desc = "Dot case: lorem.ipsum" },
    { "<leader>MXcaf", "<Plug>CaserVSentenceCase",   mode = 'v', desc = "Sentence case: Lorem ipsum" },
    { "<leader>MXcag", "<Plug>CaserVMixedCase",      mode = 'v', desc = "Pascal case: LoremIpsum" },
    { "<leader>MXcah", "<Plug>CaserVTitleCase",      mode = 'v', desc = "Title case: Lorem Ipsum" },
    { "<leader>MXcai", "<Plug>CaserVTitleKebabCase", mode = 'v', desc = "Title dash case: Lorem-Ipsum" },
    { "<leader>MXcaj", "<Plug>CaserVCamelCase",      mode = 'v', desc = "Camel case: loremIpsum" },
  },
}
