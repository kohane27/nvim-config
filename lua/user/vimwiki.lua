--local status_ok, vimwiki = pcall(require, "vimwiki")
--if not status_ok then
    --vim.notify("vimwiki not working")
	--return
--end

vim.cmd([[
" text is shown normally; don't hide markers
let g:vimwiki_conceallevel=0
let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" "Temporary Wikis" treats every file with configured file-extension as a wiki.
" To disable this feature:
let g:vimwiki_global_ext = 0

let g:vimwiki_url_maxsave=0 " disable hide url
let g:vimwiki_use_mouse=1   " use mouse
]])

