vim.cmd([[
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" escape to normal mode
inoremap jk <Esc>
let mapleader = "\<Space>"

" go Normal mode in Terminal
tnoremap <C-\> <C-\><C-n>

" easy accidents
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>

" TODO unlearn bad navigation habits
nnoremap J 5gj
nnoremap K 5gk

nnoremap <C-d> 15j
nnoremap <C-u> 15k

nnoremap <C-f> 40j
nnoremap <C-b> 40k

nnoremap <Leader>j J
nnoremap <Leader>k K

" Delete without yank
nnoremap x "_x
nnoremap <Leader>y "*y
nnoremap <Leader>d "*d

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" insert empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


" Select all
nmap <C-a> gg<S-v>G

" backspace to black hole registry
nnoremap <BS> "_
vnoremap <BS> "_

"paste in new line
nnoremap p :pu<CR>

" save
nnoremap <c-s> :wa<CR>

"yank full line without new line character
nnoremap yy 0y$

"delete full line without new line character
"doesn't delete the line itself
"nnoremap dd 0D

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
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

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
set splitbelow splitright
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" Remap splits navigation to just CTRL + hjkl
"nnoremap <silent> <C-h> : <C-w>h
"nnoremap <silent> <C-l> : <C-w>l
"nnoremap <silent> <C-j> : <C-w>j
"nnoremap <silent> <C-k> : <C-w>k

" easier split size adjustment
"noremap <silent> <C-Left> :vertical resize +3<CR>
"noremap <silent> <C-Right> :vertical resize -3<CR>
"noremap <silent> <C-Up> :resize +3<CR>
"noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
"map <Leader>th <C-w>t<C-w>H
"map <Leader>tk <C-w>t<C-w>K
]])
