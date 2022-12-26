-- ╭──────────────────────────────────────────────────────────╮
-- │ Define keymaps                                           │
-- │ leader key is set as <space> in options.lua              │
-- ╰──────────────────────────────────────────────────────────╯

local function map(mode, lhs, rhs)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--custom keymaps in files:
-- leap.lua
-- toggleterm.lua
-- yanky.lua
-- hlslens.lua

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map("i", "jk", "<Esc>")

-- avoid command history
map("n", "q:", ":q<cr>")

-- maybe this will fix random capitalization?
-- map("n", "<Space>", "<Nop>")
-- map("v", "<Space>", "<Nop>")

-- unlearn bad habits
map("n", "J", "<nop>")
map("n", "K", "<nop>")
map("n", "<C-a>", "<nop>")
map("n", "<C-x>", "<nop>")
map("n", "ZZ", "<nop>")
map("n", "d$", "<nop>")
map("x", "u", "<nop>")
map("x", "U", "<nop>")

-- add marks to populate jump list
-- map("n", "J", "m'5gj")
-- map("n", "K", "m'5gk")
map("n", "<Leader>j", "J")
map("n", "<Leader>k", "K")

-- operate on display lines rather than real lines
map("n", "k", "gk")
map("n", "gk", "k")
map("n", "j", "gj")
map("n", "gj", "j")
map("x", "k", "gk")
map("x", "gk", "k")
map("x", "j", "gj")
map("x", "gj", "j")

-- select 5 lines in visual mode
map("x", "J", "5j")
map("x", "K", "5k")

-- moving lines
-- conflicting with jabirali/tmux-tilish
-- map("n", "<A-j>", ":m .+1<CR>==")
-- map("n", "<A-k>", ":m .-2<CR>==")
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<C-j>", ":move '>+1<CR>gv=gv")
map("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- backspace to black hole registry
map("n", "<BS>", '"_')
map("x", "<BS>", '"_')

-- -- insert empty new line without entering insert mode
map("n", "<Leader>o", "o<Esc>")
map("n", "<Leader>O", "O<Esc>")

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

-- record into register 'q', playback with 'Q'
map("n", "Q", "@q")

-- select current line excluding newline character
map("x", "$", "g_")

map("n", "0", "^")

-- don't copy replaced text after pasting
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
-- map("v", "p", ":<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>")

-- yank till end of line
map("n", "Y", "y$")

-- delete one word forward in Insert mode
map("i", "<C-e>", "<C-o>de")

-- delete backwards till whitespace
map("i", "<C-b>", "<C-o>dB")

-- -- paste last yanked / deleted
-- map("i", "<C-f>", '<C-R>"')
-- -- paste clipboard content
-- map("i", "<C-v>", "<C-R>*")

vim.cmd([[
" close and save all buffer
cnoremap x xa

" wean off `:wq` and `:q`
cnoremap <expr> <CR> getcmdtype() == ":" && index(["q", "wq"], getcmdline()) >= 0 ? "<C-u>" : "<CR>"

" `wilder.nvim`: previous and next command key mapping to be compatible
cnoremap <expr> <C-j> wildmenumode() ? "\<C-N>" : "\<Down>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-P>" : "\<Up>"
]])
