local status_ok, ripgrep = pcall(require, "ripgrep")
if not status_ok then
	return
end

vim.api.nvim_exec(
[[
    let g:rg_derive_root='true'
]],
true)
