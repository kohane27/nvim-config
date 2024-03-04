-- ╭──────────────────────────────────────────────────────────╮
-- │ Autocommand functions                                    │
-- │ Define autocommands with Lua APIs                        │
-- │ See: h:api-autocmd, h:augroup                            │
-- ╰──────────────────────────────────────────────────────────╯

vim.cmd([[
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

  augroup _tmux_rename
    autocmd!
    if exists('$TMUX')

      let data = readfile($HOME .'/.config/nvim/substitutes--.txt')
      let cwd = fnamemodify(getcwd(), ':t')
      let shortened_cwd = substitute(cwd, data[0], "", "")
      autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . shortened_cwd . "/" . expand("%:t"))

      " autocmd VimLeave,FocusLost * call system("tmux rename-window \"\"") " to enable auto-rename again
    endif
    augroup end

    "" show line diagnostics automatically in hover window
    "autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })

  " clear `jumplist`
  autocmd VimEnter * :clearjumps

  " clear marks
  autocmd VimEnter * :delmarks a-zA-Z0-9
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

-- Enable spellcheck
autocmd("FileType", {
  pattern = { "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
