-- ╭──────────────────────────────────────────────────────────╮
-- │ Autocommand functions                                    │
-- │ Define autocommands with Lua APIs                        │
-- │ See: h:api-autocmd, h:augroup                            │
-- ╰──────────────────────────────────────────────────────────╯

vim.cmd([[
  " disable auto-indentation
  " autocmd filetype markdown set indentexpr=
  " autocmd fileType markdown setl conceallevel=1

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  " clear jumplist
  autocmd VimEnter * :clearjumps

" disable syntax highlighting in big files
function DisableSyntaxTreesitter()
    echo("Big file: Disabling syntax, treesitter and folding")
    if exists(':TSBufDisable')
        exec 'TSBufDisable autotag'
        exec 'TSBufDisable highlight'
    endif

    set foldmethod=manual
    syntax clear
    syntax off
    filetype off
    set noundofile
    set noswapfile
    set noloadplugins
endfunction

augroup BigFileDisable
    autocmd!
    autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 512 * 1024 * 1.5 | exec DisableSyntaxTreesitter() | endif

augroup END
]])

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "300" })
  end,
})

-- Enable spellcheck in text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
