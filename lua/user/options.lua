vim.cmd([[
"""" => General Settings
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

" from lightline.vim
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
]])
