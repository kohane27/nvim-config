--local status_ok, ripgrep = pcall(require, "ripgrep")
--if not status_ok then
--	return
--end

vim.cmd([[
    let g:rg_derive_root='true'
]])
