-- Setup nvim-cmp
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
	check_ts = true,
	ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
	enable_check_bracket_line = false, -- if next character is a close pair and it doesn't have an open pair in same line, then it will not add a close pair
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false, -- don't check treesitter on java
	},
	disable_filetype = { "TelescopePrompt" },
	-- fast_wrap = {
	-- 	map = "<M-e>",
	-- 	chars = { "{", "[", "(", '"', "'" },
	-- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
	-- 	offset = 0, -- Offset from pattern match
	-- 	end_key = "$",
	-- 	keys = "qwertyuiopzxcvbnmasdfghjkl",
	-- 	check_comma = true,
	-- 	highlight = "PmenuSel",
	-- 	highlight_grey = "LineNr",
	-- },
})

-- You need to add mapping `CR` on nvim-cmp setup. Check readme.md on nvim-cmp repo.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
