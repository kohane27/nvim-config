local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  print("nvim-surround not working")
end

vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal)$")

local M = {}

nvim_surround.setup({
  keymaps = {
    insert = false,
    insert_line = false,
    normal = "ys",
    normal_cur = "yss",
    normal_line = false,
    normal_cur_line = false,
    visual = "S",
    visual_line = false,
    delete = "ds",
    change = "cs",
  },
  -- `ds(` doesn't work after enabling below
  -- surrounds = {
  --   ["("] = {
  --     add = { "(", ")" },
  --     find = function()
  --       return M.get_selection({ motion = "a)" })
  --     end,
  --     delete = "^(.)().-(.)()$",
  --   },
  --   ["{"] = {
  --     add = { "{", "}" },
  --     find = function()
  --       return M.get_selection({ motion = "a}" })
  --     end,
  --     delete = "^(.)().-(.)()$",
  --   },
  --   ["<"] = {
  --     add = { "<", ">" },
  --     find = function()
  --       return M.get_selection({ motion = "a>" })
  --     end,
  --     delete = "^(.)().-(.)()$",
  --   },
  --   ["["] = {
  --     add = { "[", "]" },
  --     find = function()
  --       return M.get_selection({ motion = "a]" })
  --     end,
  --     delete = "^(.)().-(.)()$",
  --   },
  -- },
})
