-----------------------------------------------------------
-- Define keymaps
-- leader key is set as <space> in options.lua
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--custom keymaps in the following
--leap.lua
--barbar.lua
--yanky.lua
--sniprun.lua
--substitute.lua
--tmux.lua

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map("i", "jk", "<Esc>")

-- unlearn bad habits
map("n", "<C-a>", "<nop>")
map("n", "<C-x>", "<nop>")
map("n", "ZZ", "<nop>")
map("n", "J", "<nop>")
map("n", "K", "<nop>")
map("n", "d$", "<nop>")

map("n", "J", "5j")
map("n", "K", "5k")

map("n", "<C-d>", "13j")
map("n", "<C-u>", "13k")

map("n", "<C-f>", "30j")
map("n", "<C-b>", "30k")

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
-- BUG: conflicting with jabirali/tmux-tilish
-- map("n", "<A-j>", ":m .+1<CR>==")
-- map("n", "<A-k>", ":m .-2<CR>==")
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<C-j>", ":move '>+1<CR>gv=gv")
map("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- handle by barbar.nvim
-- map("n", "<A-c>", ": Bdelete<cr>")

-- backspace to black hole registry
map("n", "<BS>", '"_')
map("v", "<BS>", '"_')

-- insert empty new line without entering insert mode
map("n", "<Leader>o", "o<Esc>")
map("n", "<Leader>O", "O<Esc>")

-- reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
map("v", "y", "myy`y")
map("v", "Y", "myY`y")

-- Keep it centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- map("n", "J", "mzJ`z") -- not sure what it does

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

map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

-- don't copy the replaced text after pasting
map("v", "p", ":<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>")
-- map("v", "<leader>p", ":<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>")
-- if the above doesn't work, try below:
-- vnoremap p "_c<C-r><C-o>+<Esc>

-- map("v", "<leader>p", '"_dP')

-- yank till end of line
map("n", "Y", "y$")

-- delete one word forward in Insert mode
map("i", "<C-e>", "<C-o>de")

-- vim-visual-*m*ulti remap
-- create a column of cursors from visual mode
map("n", "<A-m>", ":call vm#commands#add_cursor_down(0, v:count1)<cr>")

-- move changelist: jump between edit locations
map("n", "<A-o>", "g;")
map("n", "<A-i>", "g,")

-- delete backwards till whitespace
map("i", "<C-b>", "<C-o>dB")
-- insert mode: paste yanked / deleted
-- CTRL-R " (the unnamed register) inserts the last delete or yank
map("i", "<C-f>", '<C-R>"')
-- insert mode: paste clipboard content
-- CTRL-R * will insert clipboard contents
map("i", "<C-v>", "<C-R>*")

-- allow gf to open non-existent files
-- BUG: will create non-existent file instead of jumping
-- map("n", "gf", ":edit <cfile><cr>")

-- save
map("n", "<c-s>", ":wa<CR>")
map("i", "<c-s>", "<c-o>:w<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- <C-m> is <CR> and <CR> is <C-m>
-- They are the same key so you can't map something to <C-m> without mapping it to <CR> and vice-versa.
-- You'll need to find another key combo for your mapping.

-- paste in new line
-- BUG: if paste to new buffer
-- map("n", "p", ":pu<CR>")

vim.cmd([[
" wean off `:wq` and `:q` in favor of zz
cnoremap <expr> <CR> getcmdtype() == ":" && index(["q", "wq"], getcmdline()) >= 0 ? "<C-u>" : "<CR>"

" previous and next command key mapping to be compatible for `wilder.nvim`
cnoremap <expr> <C-j> wildmenumode() ? "\<C-N>" : "\<Down>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-P>" : "\<Up>"
]])
