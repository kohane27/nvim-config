-- flash cursor when jumping
return {
  "danilamihailov/beacon.nvim",
  event = "VeryLazy",
  config = function()
    vim.cmd([[
    let g:beacon_timeout = 450
    let g:beacon_size = 70
    let g:beacon_minimal_jump = 10
    let g:beacon_ignore_filetypes = ["toggleterm", "NvimTree", "qf", "help", "TelescopePrompt", "frecency", "harpoon", "grapple", "fzf", "portal", "nvim-navbuddy"]
    " highlight Beacon guibg=#3a567d
     " base = "#3a567d", " bright = "#617897", " dim = "#2e4564"
]])
  end
}
