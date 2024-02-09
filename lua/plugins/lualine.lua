return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = function()
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
        refresh = {
          statusline = 500,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        -- remove defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- remove defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ left section                                             │
    --  ╰──────────────────────────────────────────────────────────╯
    ins_left({
      "b:gitsigns_head",
      icon = "",
      color = { fg = colors.violet },
    })

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end
    ins_left({
      "diff",
      source = diff_source,
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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ mid section                                              │
    --  ╰──────────────────────────────────────────────────────────╯
    -- ins_left({
    --   function()
    --     return "%="
    --   end,
    -- })

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ right section                                            │
    --  ╰──────────────────────────────────────────────────────────╯
    -- ins_right({
    --   function()
    --     return "󰓹 " .. require("grapple").key()
    --   end,
    --   cond = require("grapple").exists,
    --   color = { fg = colors.violet },
    -- })

    local custom_filetype = require("lualine.components.filetype"):extend()
    local highlight = require("lualine.highlight")
    local default_status_colors = { saved = colors.violet, modified = colors.darkblue }
    function custom_filetype:init(options)
      custom_filetype.super.init(self, options)
      self.status_colors = {
        saved = highlight.create_component_highlight_group(
          { fg = default_status_colors.saved },
          "filename_status_saved",
          self.options
        ),
        modified = highlight.create_component_highlight_group(
          { fg = default_status_colors.modified },
          "filename_status_modified",
          self.options
        ),
      }
      if self.options.color == nil then
        self.options.color = ""
      end
    end
    function custom_filetype:update_status()
      local data = custom_filetype.super.update_status(self)
      data = highlight.component_format_highlight(
        vim.bo.modified and self.status_colors.modified or self.status_colors.saved
      ) .. data
      return data
    end

    ins_right({ custom_filetype })
    ins_right({ "location", color = { fg = colors.violet } })
    ins_right({ "progress", color = { fg = colors.violet } })
    require("lualine").setup(config)
  end,
}
