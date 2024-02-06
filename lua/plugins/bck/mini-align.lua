-- TODO: check it out
return {
  "echasnovski/mini.align",
  version = false,
  config = function()
    require("mini.align").setup({
      mappings = {
        start = "<leader>a",
        start_with_preview = "<leader>A",
      },
    })
  end,
}
