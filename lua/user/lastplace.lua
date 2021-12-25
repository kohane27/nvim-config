--local status_ok, lastplace = pcall(require, "lastplace")
--if not status_ok then
--	return
--end

vim.cmd([[
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
]])
