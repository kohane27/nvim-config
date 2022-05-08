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

map('n', '<C-d>', '13j')
map('n', '<C-u>', '13k')

map('n', '<C-f>', '30j')
map('n', '<C-b>', '30k')

map('n', '<Leader>j', 'J')
map('n', '<Leader>k', 'K')

-- yank till end of line
map('n', 'Y', 'y$')

-- operate on display lines rather than real lines
map('n', 'k', 'gk')
map('n', 'gk', 'k')
map('n', 'j', 'gj')
map('n', 'gj', 'j')
map('x', 'k', 'gk')
map('x', 'gk', 'k')
map('x', 'j', 'gj')
map('x', 'gj', 'j')

-- select 5 lines in visual mode
map('x', 'J', '5j')
map('x', 'K', '5k')


-- backspace to black hole registry
map('n', '<BS>', '"_')
map('v', '<BS>', '"_')

-- insert empty new line without entering insert mode
map('n', '<Leader>o', 'o<Esc>')
map('n', '<Leader>O', 'O<Esc>')

-- saving
map('n', '<c-s>', ':wa<CR>')
-- map('i', '<leader>s', '<C-c>:w<CR>')

-- Reload configuration without restart nvim
-- map('n', '<leader>r', ':so %<CR>')
-- Close all windows and exit from Neovim with <leader> and q
-- map('n', '<leader>q', ':qa!<CR>')
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


" " Delete without yank
" nnoremap x "_x
" vnoremap x "_x


"paste in new line
"bug if paste to new buffer
" nnoremap p :pu<CR>



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
