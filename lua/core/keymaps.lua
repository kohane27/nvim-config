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
-- sniprun.lua
-- vim-EnhancedJumps.lua

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map("i", "jk", "<Esc>")

-- avoid command history
map("n", "q:", ":q<cr>")

-- maybe this will fix random capitalization?
map("n", "<Space>", "<Nop>")
map("v", "<Space>", "<Nop>")

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

-- change list
map("n", "<C-j>", "g;")
map("n", "<C-k>", "g,")

-- quickfix list
map("n", "<A-p>", "<cmd>cp<cr>")
map("n", "<A-n>", "<cmd>cn<cr>")

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

-- -- insert empty new line without entering insert mode
map("n", "<Leader>o", "o<Esc>")
map("n", "<Leader>O", "O<Esc>")

-- using `stay-in-place.lua`
-- re-select visual selection after indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")

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

map("n", "0", "^")

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
-- map("n", "<c-s>", ":wa<CR>")
-- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
map("n", "<c-s>", ":write | edit | TSBufEnable highlight<CR>")
map("i", "<c-s>", "<c-o>:w<CR>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ Applications and Plugins shortcuts                       │
-- ╰──────────────────────────────────────────────────────────╯

-- ╭──────────────────────────────────────────────────────────╮
-- │ LSP                                                      │
-- ╰──────────────────────────────────────────────────────────╯

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")

map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>lT", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>")

-- implementation (rarely)
map("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>lI", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")

-- code action
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")

-- code lens
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>")

-- reference list
map("n", "<leader>lr", "<cmd>Trouble lsp_references<CR>")
map("n", "<leader>lR", "<cmd>lua require('goto-preview').goto_preview_references()<CR>")

-- rename
map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>")

-- show hover doc
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>lH", "<cmd>Lspsaga peek_definition<CR>")

-- TODO not working show signature help
map("n", "<leader>ls", "<cmd>Lspsaga signature_help<CR>")

-- formatting
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>")

map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ barbar.lua                                               │
-- ╰──────────────────────────────────────────────────────────╯
-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>")
map("n", "<A-.>", ":BufferNext<CR>")

-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>")
map("n", "<A->>", " :BufferMoveNext<CR>")

-- close buffer
map("n", "<A-c>", ":BufferClose<CR>")
-- map("n", "<A-c>", ":BufferCloseAllButCurrent<CR>")

-- toggle pin
-- map("n", "<A-p>", ":BufferPin<CR>")
-- map("n", "<A-C>", ":BufferCloseAllButPinned<CR>")
-- map("n", "<A-C>", ":BufferCloseAllButCurrentOrPinned<CR>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ comment_box                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- left aligned fixed size box with left aligned text
map("v", "<leader>mb", "<cmd>lua require('comment-box').lbox()<cr>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ neozoom                                                  │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set("n", "<C-w>o", function()
  vim.cmd("NeoZoomToggle")
end, { noremap = true, silent = true, nowait = true })

-- ╭──────────────────────────────────────────────────────────╮
-- │ substitute.lua                                           │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>")
map("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>")
map("x", "cx", "<cmd>lua require('substitute.exchange').visual()<cr>")
map("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ tmux.lua                                                 │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<A-h>", '<cmd>lua require("tmux").move_left()<cr>')
map("n", "<A-l>", '<cmd>lua require("tmux").move_right()<cr>')
map("n", "<A-k>", '<cmd>lua require("tmux").move_top()<cr>')
map("n", "<A-j>", '<cmd>lua require("tmux").move_bottom()<cr>')

map("n", "<C-Left>", '<cmd>lua require("tmux").resize_left()<cr>')
map("n", "<C-Right>", '<cmd>lua require("tmux").resize_right()<cr>')
map("n", "<C-Up>", '<cmd>lua require("tmux").resize_top()<cr>')
map("n", "<C-Down>", '<cmd>lua require("tmux").resize_bottom()<cr>')

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
