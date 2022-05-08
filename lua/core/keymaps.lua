-----------------------------------------------------------
-- Define keymaps
-- leader key is set as <space> in options.lua
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
map('i', 'jk', '<Esc>')

-- unlearn bad habits
map('n', '<C-a>', '<nop>')
map('n', '<C-x>', '<nop>')
map('n', 'ZZ', '<nop>')
map('n', 'J', '<nop>')
map('n', 'K', '<nop>')
map('n', 'd$', '<nop>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- saving
map('n', '<c-s>', ':wa<CR>')

map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit


-- TODO migrate to lua
vim.cmd([[

" go Normal mode in Terminal
tnoremap <C-\> <C-\><C-n>

nnoremap <C-d> 13j
nnoremap <C-u> 13k

nnoremap <C-f> 30j
nnoremap <C-b> 30k

nnoremap <Leader>j J
nnoremap <Leader>k K

" " Delete without yank
" nnoremap x "_x
" vnoremap x "_x

" insert empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" backspace to black hole registry
nnoremap <BS> "_
vnoremap <BS> "_

"paste in new line
"bug if paste to new buffer
" nnoremap p :pu<CR>

" yank till end of line
nnoremap Y y$

" operate on display lines rather than real lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

xnoremap k gk
xnoremap gk k
xnoremap j gj
xnoremap gj j

"select 5 lines in visual mode
xnoremap J 5j
xnoremap K 5k

"Mappings to move lines
" conflicting with jabirali/tmux-tilish
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <A-c> : Bdelete<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

"ThePrimeagen below"

" Keep it centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z " not sure what it does
" nnoremap m zz
" unlearn bad habit
" nnoremap zz <Nop>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap [ [<C-g>u

" replace visual selection without copying it
"vnoremap p "_dP delete weird space don't use this
vnoremap <leader>p "_dP

nnoremap <Leader>y "*y
vnoremap <leader>y "*y

"yank till end of line
nmap <leader>Y "*Y 

nnoremap <leader>d "_d
vnoremap <leader>d "_d

"Delete one word forward in Insert mode
inoremap <C-e> <C-o>de

"CTRL-R * will insert clipboard contents
"CTRL-R " (the unnamed register) inserts the last delete or yank

"insert mode: paste yanked / deleted
inoremap <C-f> <C-R>"
"insert mode: paste clipboard content
inoremap <C-v> <C-R>*

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" wean off `:wq` and `:q` in favor of zz
cnoremap <expr> <CR> getcmdtype() == ":" && index(["q", "wq"], getcmdline()) >= 0 ? "<C-u>" : "<CR>"

" For Obsidian
" Emoji shortcuts for Obsidian Tasks
ab :due: 📅
ab :done: ✅
" ab :sch: ⏳
" ab :sta: 🛫

ab :re: 🔁
ab :hp: ⏫
ab :mp: 🔼
ab :lp: 🔽

inoremap td - [ ] 
iab doto ✅ <c-r>=strftime("%Y-%m-%d")<cr>
iab duto 📅 <c-r>=strftime("%Y-%m-%d")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode Ctrls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keep these
"CTRL-J	    Begin new line.
"CTRL-A		Insert previously inserted text.

" kept except visual mode
"CTRL-C		Quit insert mode, go back to Normal mode.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits (using i3 or tmux)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier split size adjustment
noremap <silent> <Left> :vertical resize +3<CR>
noremap <silent> <Right> :vertical resize -3<CR>
noremap <silent> <Up> :resize +3<CR>
noremap <silent> <Down> :resize -3<CR>

]])
