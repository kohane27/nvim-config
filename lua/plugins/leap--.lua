local status_ok, leap = pcall(require, "leap")
if not status_ok then
	print("leap failing")
end

-- true to override conflicts
leap.set_default_keymaps(true)

-- leap.setup {
--  case_insensitive = true,
-- }

function Leap_Bidirectional()
	require("leap").leap({
		["target-windows"] = { vim.fn.getwininfo(vim.fn.win_getid())[1] },
	})
end

vim.api.nvim_set_keymap("n", "s", ":lua Leap_Bidirectional()<CR>", { noremap = true, silent = true })
