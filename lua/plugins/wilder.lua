local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
	print("wilder failing")
end

wilder.setup({
	modes = { ":", "/", "?" },
	enable_cmdline_enter = 0,
})

-- Disable Python remote plugin
wilder.set_option("use_python_remote_plugin", 0)

wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
			fuzzy_filter = wilder.lua_fzy_filter(),
		}),
		wilder.vim_search_pipeline()
	),
})

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer({
			highlighter = wilder.lua_fzy_highlighter(),
			highlights = {
				accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
			},
			left = {
				" ",
				wilder.popupmenu_devicons(),
			},
			right = {
				" ",
				wilder.popupmenu_scrollbar(),
			},
		}),
		["/"] = wilder.wildmenu_renderer({
			highlighter = wilder.lua_fzy_highlighter(),
		}),
	})
)
