-- ╭──────────────────────────────────────────────────────────╮
-- │ Define keymaps                                           │
-- │ leader key is set as <space> in options.lua              │
-- ╰──────────────────────────────────────────────────────────╯

local map = require("core.utils").map

-- NOTE: Insert mode `C-g` is unmapped
-- custom keymaps in files:
-- leap.lua
-- toggleterm.lua
-- hlslens.lua
-- marks.lua
-- ufo.lua
-- nvim-surround.lua
-- nap.lua
-- recorder.lua

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map("i", "jk", "<Esc>")

-- `kanata`: disable typing accented characters
-- `:h digraph`
map("i", "<C-k>", "<Esc>")

map("n", "<space>", "<Nop>")
map("x", "<space>", "<Nop>")

map("n", "[[", "<Nop>")
map("n", "]]", "<Nop>")
map("n", ")", "<Nop>")
map("n", "(", "<Nop>")

map("n", "<C-j>", "<Nop>")
map("n", "<C-k>", "<Nop>")

map("n", "<C-t>", "<Nop>")
map("n", "<C-e>", "<Nop>")

-- avoid accidents for keymappings
map("n", "<leader>x", "<Nop>")
map("n", "<leader>d", "<Nop>")
map("n", "<leader>c", "<Nop>")
map("n", "<leader>y", "<Nop>")
map("n", "<leader>k", "<Nop>")
map("n", "<leader>f", "<Nop>")
map("n", "<leader>r", "<Nop>")
map("n", "<leader>l", "<Nop>")
map("n", "<leader>t", "<Nop>")
map("n", "<leader>m", "<Nop>")
map("n", "<leader>g", "<Nop>")
map("n", "<leader>s", "<Nop>")
map("n", "<leader>a", "<Nop>")

-- disable unused keys
map("n", "<C-y>", "<Nop>")
map("n", "<S-h>", "<Nop>")
map("n", "<S-l>", "<Nop>")

map("n", "<C-z>", "<Nop>")
map("i", "<C-z>", "<Nop>")
map("v", "<C-z>", "<Nop>")

-- avoid command history
map("n", "q:", ":q<cr>")
-- no `q` for macro
map("n", "q", "<nop>")
map("n", "ZZ", "<nop>")

-- no replace mode
-- map("n", "r", "<Nop>") -- used by leap's remote mode
-- map("n", "R", "<nop>") -- used by flash's gs
map("n", "gR", "<nop>")

-- no rot13 encoding
map("n", "g??", "<nop>")
map("n", "g?g?", "<nop>")

map("i", "<C-c>", "<Esc>")

-- avoid random toggling case
map("n", "~", "<Nop>")
map("n", "g~", "<Nop>")
map("n", "gu", "<nop>")
map("n", "gU", "<nop>")

-- map("x", "u", "<nop>")
-- map("x", "U", "<nop>")

-- unlearn bad habits
map("n", "J", "<nop>")
map("n", "K", "<nop>")
map("n", "<C-a>", "<nop>")
map("n", "<C-x>", "<nop>")
map("n", "d$", "<nop>")

map("n", "<leader>j", "J")

-- operate on display lines rather than real lines
map("n", "k", "gk")
map("n", "j", "gj")
map("x", "k", "gk")
map("x", "j", "gj")

-- select 5 lines in visual mode
map("x", "J", "5j")
map("x", "K", "5k")

-- jumplist zz; it's a bit disorienting
-- map("n", "<C-o>", "<C-o>zz")
-- map("n", "<C-i>", "<C-i>zz")

-- backspace to black hole registry
map("n", "<BS><BS>", '"_')
map("x", "<BS><BS>", '"_')
map("v", "<BS><BS>", '"_')

-- don't yank to default register; exception in `cutlass.nvim`
map("n", "cl", '"_cl')
map("n", "cc", '"_cc')

-- insert empty new line without entering insert mode
map("n", "<leader>o", "o<Esc>")
map("n", "<leader>O", "O<Esc>")

-- using `stay-in-place.lua`
-- re-select visual selection after indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- map("v", "y", "myy`y")
-- map("v", "Y", "myY`y")

-- using `nvim-hlslens`
-- Keep it centered when searching
-- map("n", "n", "nzzzv")
-- map("n", "N", "Nzzzv")

-- undo break points in insert mode
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "[", "[<C-g>u")

-- select current line excluding newline character
map("x", "$", "g_")

map("n", "0", "^")

-- don't copy replaced text after pasting
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
-- map("v", "p", ":<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>")

-- Paste from register 0 (last yanked)
-- map("n", "gp", '"0p')

-- yank till end of line
map("n", "Y", "y$")

-- delete one word forward in Insert mode
-- map("i", "<C-e>", "<C-o>de")

-- delete backwards till whitespace
map("i", "<C-b>", "<C-o>dB")

-- -- paste last yanked / deleted
-- map("i", "<C-f>", '<C-R>"')
-- -- paste clipboard content
-- map("i", "<C-v>", "<C-R>*")

vim.cmd([[
" save and close all buffer(s)
" x -> xa
" cnoremap <expr> <CR> getcmdtype() == ":" && index(["x"], getcmdline()) >= 0 ? "a<CR>" : "<CR>"

" wean off `:x` and `:q`
" cnoremap <expr> <CR> getcmdtype() == ":" && index(["q", "x"], getcmdline()) >= 0 ? "<C-u>" : "<CR>"

" default to use "very magic" mode
" nnoremap / /\v
" cnoremap s/ s/\v
" cnoremap g/ g/\v
" cnoremap g!/ g!/\v
cnoremap norm norm!

]])
