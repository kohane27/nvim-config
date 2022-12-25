local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("lualine failing")
end

-- stylua: ignore

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

-- Config
local config = {
  options = {
    globalstatus = true,
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
  },
  sections = {
    -- to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- to remove the defaults
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

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return " "
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
  "branch",
  icon = "",
})

ins_left({
  "diff",
  symbols = { added = " ", modified = "柳 ", removed = " " },
  cond = conditions.hide_in_width,
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

-- Add components to right sections
ins_right({
  "o:encoding", -- option component same as &encoding in viml
  cond = conditions.hide_in_width,
})

ins_right({
  "fileformat",
  -- fmt = string.upper,
  icons_enabled = true,
  symbols = {
    unix = "",
    dos = "",
    mac = "",
  },
})

ins_right({
  "filename",
  cond = conditions.buffer_not_empty,
})

ins_right({
  function()
    local key = require("grapple").key()
    return " [" .. key .. "]"
  end,
  cond = require("grapple").exists,
})

ins_right({ "location" })

ins_right({ "progress" })

-- initialize lualine
lualine.setup(config)
