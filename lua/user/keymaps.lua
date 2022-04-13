vim.cmd([[
" escape to normal mode
inoremap jk <Esc>
let mapleader = "\<Space>"

" go Normal mode in Terminal
tnoremap <C-\> <C-\><C-n>

" easy accidents
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>

" unlearn bad navigation habits
nnoremap J <nop>
nnoremap K <nop>
"nnoremap J 5gj
"nnoremap K 5gk

nnoremap <C-d> 13j
nnoremap <C-u> 13k

nnoremap <C-f> 30j
nnoremap <C-b> 30k

nnoremap <Leader>j J
nnoremap <Leader>k K

" Delete without yank
nnoremap x "_x


" insert empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Select all
" nmap <C-a> gg<S-v>G

" backspace to black hole registry
nnoremap <BS> "_
vnoremap <BS> "_

"paste in new line
"bug if paste to new buffer
" nnoremap p :pu<CR> 

" yank till end of line
nnoremap Y y$

" get rid of bad habit for D/C
nnoremap d$ <Nop>

"yank full line without new line character
"nnoremap yy 0y$

" save
nnoremap <c-s> :wa<CR>

" Next/Previous Tab
nnoremap g[ gT
nnoremap g] gt

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
" TODO consider https://github.com/matze/vim-move
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
nnoremap m zz
" unlearn bad habit
nnoremap zz <Nop>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap [ [<C-g>u

xnoremap <leader>p "_dP

" replace visual selection without copying it
"vnoremap p "_dP delete weird space don't use this
vnoremap <leader>p "_dP

nnoremap <Leader>y "*y
vnoremap <leader>y "*y

"yank till end of line
nmap <leader>Y "*Y 

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode Ctrls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keep these
"CTRL-J	    Begin new line.
"CTRL-A		Insert previously inserted text.
"
" kept except visual mode
"CTRL-C		Quit insert mode, go back to Normal mode.

" copy visual selected
vnoremap <C-c> "*y

"Delete one word forward in Insert mode
inoremap <C-e> <C-o>de

"CTRL-R * will insert clipboard contents
"CTRL-R " (the unnamed register) inserts the last delete or yank

"insert mode: paste yanked / deleted
inoremap <C-f> <C-R>"
"insert mode: paste clipboard content
inoremap <C-v> <C-R>*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files (using i3 or tmux)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=FiraCode\ Nerd\ Font:h19
set splitbelow splitright
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" easier split size adjustment
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
]])
