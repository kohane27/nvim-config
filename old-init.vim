"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set path+=**                    " Searches current directory recursively
set wildmenu                    " Display all matches when tab complete
set hidden                      " Needed keep multiple buffers open
set fileencoding=utf-8
set t_Co=256                    " Set if term supports 256 colors
set termguicolors
let g:rehash256 = 1
set showmatch                   " show matching 
set wrap                        " soft wrapping text
set linebreak
"set nolist
set ignorecase                  " case insensitive
set hlsearch                    " highlight search 
set incsearch                   " incremental search
set number relativenumber       " Display line numbers
set wildmode=longest,list       " get bash-like tab completions
set cursorline                  " highlight current line
set noshowmatch                 " no jumping for matching brackets

" from jess
set signcolumn=yes:2
set title
" set smartcase
set wildmode=longest:full,full
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=8            " cursor won't go the bottom
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set exrc
set updatetime=300    " coc: reduce time for highlighting other references
set redrawtime=10000  " allow more time for loading syntax on large files
" end jess

" from chris
set completeopt=menuone,noselect          " for cmp
set pumheight=10                          " pop up menu height
set showmode                              " No -- INSERT --
set showtabline=2                         " always show tabs
set smartindent
set timeoutlen=100                        " time to wait for a mapped sequence to complete
set undofile                              " enable persistent undo
set nowritebackup                         " disable editing a file that is being edited
set shiftwidth=2                          " spaces inserted for each indentation
set tabstop=2                             " 2 spaces for a tab
set iskeyword+=-
" end chris

" scroll 14 lines with <C-D> or <C-U>
" autocmd VimResized * :set scroll=14

filetype plugin indent on                       " allow auto-indenting depending on file type
syntax on
set clipboard=unnamedplus                       " Copy/paste between vim and other programs
filetype plugin on
set encoding=utf-8
set backup                                      " keep a backup file
set backupdir=~/.local/share/nvim/backup//      " store backup files
set dir=~/.cache/vim                            " store swap files

"enable relative numbers only in Normal mode
"absolute numbers only in Insert mode.
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

set shortmess+=I           " Disable intro message
set sessionoptions+=globals " for obsession.vim
set inccommand=nosplit     " Live substitution

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set autoindent                  " indent a new line the same amount as the line just typed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a                 " enable mouse click
" set mouse=r                 " middle-click to paste

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fix sizing bug with Alacritty
" autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

"Below all available for remap in insert mode
"CTRL-I     Insert a tab.
"CTRL-M	    Begin new line.
"CTRL-T		Insert one shiftwidth of indent at the start of the current line.  
"CTRL-D	    Delete all indent in the current line.
"CTRL-Q		Same as CTRL-V.
"CTRL-Y		Insert the character which is above the cursor. 

" 132
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"{{ nvim plugins }}
    Plug 'ggandor/lightspeed.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'folke/which-key.nvim'
    Plug 'ahmedkhalf/project.nvim'
    " Plug 'akinsho/toggleterm.nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Plug 'Pocco81/AutoSave.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'norcalli/nvim-colorizer.lua'
    "TODO replace lightline.vim
    " Plug 'nvim-lualine/lualine.nvim'
    Plug 'rmagatti/auto-session'

"{{ LSP }}
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer' " simple to use language server installer
    Plug 'tamago324/nlsp-settings.nvim'    " language server settings defined in json for
    Plug 'jose-elias-alvarez/null-ls.nvim' " formatters and linters

"{{ cmp }}
    Plug 'hrsh7th/nvim-cmp'                " The completion plugin
    Plug 'hrsh7th/cmp-buffer'              " buffer completions
    Plug 'hrsh7th/cmp-path'                " path completions
    Plug 'hrsh7th/cmp-cmdline'             " cmdline completions
    Plug 'saadparwaiz1/cmp_luasnip'        " snippet completions
    Plug 'hrsh7th/cmp-nvim-lsp'

    " snippet engine required for cmp
    Plug 'L3MON4D3/LuaSnip'                " snippet engine
    Plug 'rafamadriz/friendly-snippets'    " a bunch of snippets to use

    " TODO For vsnip users
    "Plug 'hrsh7th/cmp-vsnip'
    "Plug 'hrsh7th/vim-vsnip'

    " For luasnip users
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'

    " For ultisnips users
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'

"{{ Basics }}
    source ~/.config/nvim/plugins/lightline.vim
    "source ~/.config/nvim/plugins/instant-markdown.vim
    "source ~/.config/nvim/plugins/nerdtree.vim

"{{ Productivity }}
    source ~/.config/nvim/plugins/ripgrep.vim
    " source ~/.config/nvim/plugins/fzf.vim
    source ~/.config/nvim/plugins/vimwiki.vim
    source ~/.config/nvim/plugins/undotree.vim
    source ~/.config/nvim/plugins/executioner.vim
    source ~/.config/nvim/plugins/echodoc.vim
    source ~/.config/nvim/plugins/targets.vim
    " source ~/.config/nvim/plugins/nvim-bqf.vim
    source ~/.config/nvim/plugins/vim-matchup.vim
    source ~/.config/nvim/plugins/floaterm.vim

"{{ Snippets Plugins }}
    source ~/.config/nvim/plugins/ultisnips.vim

"{{ Tim Pope Plugins }}
    "source ~/.config/nvim/plugins/vim-fugitive.vim
    source ~/.config/nvim/plugins/surround.vim
    source ~/.config/nvim/plugins/repeat.vim
    " source ~/.config/nvim/plugins/obsession.vim
    
"{{ Syntax Highlighting and Colors }}
    source ~/.config/nvim/plugins/sxhkd-vim.vim
    " source ~/.config/nvim/plugins/css-color.vim
    source ~/.config/nvim/plugins/polyglot.vim

"{{ Junegunn Plugins }}
    "source ~/.config/nvim/plugins/goyo.vim
    " source ~/.config/nvim/plugins/limelight.vim
    source ~/.config/nvim/plugins/easy-align.vim
    source ~/.config/nvim/plugins/emoji.vim

"{{ Misc Plugins }}
    source ~/.config/nvim/plugins/visual-multi.vim
    source ~/.config/nvim/plugins/lastplace.vim
    source ~/.config/nvim/plugins/smoothie.vim
    source ~/.config/nvim/plugins/pear-tree.vim
    source ~/.config/nvim/plugins/barbar.vim
    source ~/.config/nvim/plugins/nerdcommenter.vim
    source ~/.config/nvim/plugins/neoformat.vim
    source ~/.config/nvim/plugins/context-commentstring.vim
    "source ~/.config/nvim/plugins/rooter.vim
    source ~/.config/nvim/plugins/peekaboo.vim
    source ~/.config/nvim/plugins/sayonara.vim
    " TODO
    " source ~/.config/nvim/plugins/dashboard-nvim.vim

"{{ Themes }}
    source ~/.config/nvim/plugins/nvim-web-devicons.vim
    source ~/.config/nvim/plugins/onedarker.nvim
    source ~/.config/nvim/plugins/darkplus.nvim
    source ~/.config/nvim/plugins/dracula.nvim
    source ~/.config/nvim/plugins/onedark.vim
    source ~/.config/nvim/plugins/gruvbox.vim
    source ~/.config/nvim/plugins/tokyonight.vim
"{{ Active Theme }}
   source ~/.config/nvim/plugins/doom-one.vim

call plug#end()

doautocmd User PlugLoaded

colorscheme doom-one

"{{ Loading nvim plugins after plug#end }}
    source ~/.config/nvim/lsp/lspconfig.lua
    source ~/.config/nvim/lsp/lsp-installer.lua
    source ~/.config/nvim/lsp/null-ls.lua

    source ~/.config/nvim/plugins/cmp.lua
    source ~/.config/nvim/plugins/telescope.lua
    source ~/.config/nvim/plugins/nvim-treesitter.lua

    source ~/.config/nvim/plugins/lightspeed.lua
    source ~/.config/nvim/plugins/project.lua
    source ~/.config/nvim/plugins/which-key.lua
    " source ~/.config/nvim/plugins/toggleterm.lua
    source ~/.config/nvim/plugins/harpoon.lua
    source ~/.config/nvim/plugins/nvim-tree.lua
    source ~/.config/nvim/plugins/gitsigns.lua
    source ~/.config/nvim/plugins/indent-blankline.lua
    " source ~/.config/nvim/plugins/AutoSave.lua
    " source ~/.config/nvim/plugins/auto-session.lua
    source ~/.config/nvim/plugins/nvim-colorizer.lua
    " source ~/.config/nvim/plugins/lualine.lua

"{{ Manual source ~/.config/nvim/plugins/}}
    source ~/.config/nvim/plugins/plug-update.vim
    source ~/.config/nvim/plugins/tmux.vim
    source ~/.config/nvim/plugins/neovide.vim
    source ~/.config/nvim/plugins/individual-colors.vim

