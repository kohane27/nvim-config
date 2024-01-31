-- TODO: consider using noice
return {
  "gelguy/wilder.nvim",
  event = "VeryLazy",
  opts = {
    modes = { ":", "/", "?" },
    enable_cmdline_enter = 0,
    -- next_key = "<Tab>",
    -- previous_key = "<S-Tab>",
    next_key = "<C-n>",
    previous_key = "<C-p>",
    -- accept_key = "<Down>",
    -- reject_key = "<Up>",
  },
  config = function(_, opts)
    require("wilder").setup(opts)

    local wilder = require("wilder")
    -- disable Python remote plugin
    wilder.set_option("use_python_remote_plugin", 0)

    local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      border = "rounded",
      empty_message = wilder.popupmenu_empty_message_with_spinner(),
      highlighter = wilder.lua_fzy_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
      },
      left = {
        " ",
        wilder.popupmenu_devicons(),
        wilder.popupmenu_buffer_flags({
          flags = " a + ",
          icons = { ["+"] = "󰏫", a = "󰈔", h = "󰈤" },
        }),
      },
      right = {
        " ",
        wilder.popupmenu_scrollbar(),
      },
    }))

    local wildmenu_renderer = wilder.wildmenu_renderer({
      highlighter = wilder.lua_fzy_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
      },
      separator = " · ",
      left = { " ", wilder.wildmenu_spinner(), " " },
      right = { " ", wilder.wildmenu_index() },
    })

    wilder.set_option(
      "renderer",
      wilder.renderer_mux({
        [":"] = popupmenu_renderer,
        ["/"] = wildmenu_renderer,
        substitute = wildmenu_renderer,
      })
    )
    vim.cmd([[
    " previous and next command key mapping to be compatible
    cnoremap <expr> <C-j> wildmenumode() ? "\<C-N>" : "\<Down>"
    cnoremap <expr> <C-k> wildmenumode() ? "\<C-P>" : "\<Up>"
    ]])
  end,
}
