local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("lualine not working")
end

-- colorscheme kanagawa-wave
-- stylua: ignore
local colors = {
  bg       = '#1F1F28',
  fg       = '#C8C093',
  yellow   = '#DCA561',
  cyan     = '#6A9589',
  darkblue = '#658594',
  green    = '#7AA89F',
  orange   = '#FFA066',
  violet   = '#9CABCA',
  magenta  = '#957FB8',
  blue     = '#A3D4D5',
  red      = '#E46876',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  "branch",
  icon = "",
  color = { fg = colors.violet },
})

ins_left({
  "diff",
  colored = true,
  symbols = { added = " ", modified = "󰝤 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

-- mid section. You can make any number of sections
-- for lualine it's any number greater then 2
-- ins_left({
--   function()
--     return "%="
--   end,
-- })

-- right sections
-- ins_right({
--   "o:encoding",
--   cond = conditions.hide_in_width,
--   color = { fg = colors.violet },
-- })
-- ins_right({
--   "fileformat",
--   icons_enabled = false,
--   color = { fg = colors.violet },
-- })

ins_right({
  function()
    local key = require("grapple").key()
    return "󰓹 " .. key
  end,
  cond = require("grapple").exists,
  color = { fg = colors.violet },
})

ins_right({ "filetype", color = { fg = colors.violet } })
ins_right({ "location", color = { fg = colors.violet } })
ins_right({ "progress", color = { fg = colors.violet } })

lualine.setup(config)
