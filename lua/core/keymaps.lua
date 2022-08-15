-- ╭──────────────────────────────────────────────────────────╮
-- │ Define keymaps                                           │
-- │ leader key is set as <space> in options.lua              │
-- ╰──────────────────────────────────────────────────────────╯

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
--comment-box.lua

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map("i", "jk", "<Esc>")

-- avoid command history
map("n", "q:", ":q<cr>")

-- unlearn bad habits
map("n", "<C-a>", "<nop>")
map("n", "<C-x>", "<nop>")
map("n", "ZZ", "<nop>")
map("n", "d$", "<nop>")
map("v", "u", "<nop>")
map("v", "U", "<nop>")

-- use vim-EnhancedJumps
map("n", "<C-o>", "<nop>")
map("n", "<C-i>", "<nop>")

-- add marks to populate jump list
-- map("n", "J", "m'5gj")
-- map("n", "K", "m'5gk")

map("n", "J", "5gj")
map("n", "K", "5gk")

-- -- change list
-- map("n", "<C-j>", "g;")
-- map("n", "<C-k>", "g,")

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

-- vim.keymap.set("n", "<C-G>", function()
--   -- create an empty buffer before running fzf-lua
--   if vim.bo.filetype == "NvimTree" then
--     vim.cmd("enew")
--   end
--   require("fzf-lua").files()
-- end, { noremap = true, silent = true, nowait = true })

-- backspace to black hole registry
map("n", "<BS>", '"_')
map("v", "<BS>", '"_')

-- -- insert empty new line without entering insert mode
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

-- map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
-- anyywhere on the line
map("n", "gx", "<Plug>Markdown_OpenUrlUnderCursor<CR>")

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

-- delete backwards till whitespace
map("i", "<C-b>", "<C-o>dB")

-- paste last yanked / deleted
map("i", "<C-f>", '<C-R>"')
-- paste clipboard content
map("i", "<C-v>", "<C-R>*")

-- save
map("n", "<c-s>", ":wa<CR>")
map("i", "<c-s>", "<c-o>:w<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- <C-m> is <CR> and <CR> is <C-m>
-- They are the same key so you can't map something to <C-m> without mapping it to <CR> and vice-versa.
-- You'll need to find another key combo for your mapping.

vim.cmd([[
" close and save all buffer
cnoremap x xa
" wean off `:wq` and `:q` in favor of zz
cnoremap <expr> <CR> getcmdtype() == ":" && index(["q", "wq"], getcmdline()) >= 0 ? "<C-u>" : "<CR>"

" `wilder.nvim`: previous and next command key mapping to be compatible
cnoremap <expr> <C-j> wildmenumode() ? "\<C-N>" : "\<Down>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-P>" : "\<Up>"
]])
