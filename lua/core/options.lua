-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*


vim.cmd([[
"""" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove default if these are set as default in neovim
"" 'backspace' defaults to "indent,eol,start"
"" 'complete' excludes "i"
"" 'display' defaults to "lastline,msgsep"
"" 'fillchars' defaults (in effect) to "vert:│,fold:·,sep:│"
"" 'formatoptions' defaults to "tcqj"
"" 'joinspaces' is disabled
"" 'langnoremap' is enabled
"" 'langremap' is disabled
"" 'listchars' defaults to "tab:> ,trail:-,nbsp:+"
"" 'nrformats' defaults to "bin,hex"
"" 'sessionoptions' includes "unix,slash", excludes "options"
"" 'shortmess' includes "F", excludes "S"
"" 'showcmd' is enabled
"" 'sidescroll' defaults to 1
"" 'smarttab' is enabled
"" 'startofline' is disabled
"" 'switchbuf' defaults to "uselast"
"" 'tabpagemax' defaults to 50
"" 'tags' defaults to "./tags;,tags"
"" 'ttimeoutlen' defaults to 50
"" 'undodir' defaults to ~/.local/share/nvim/undo// (|xdg|), auto-created
"" 'viewoptions' includes "unix,slash", excludes "options"
"" 'viminfo' includes "!"
"" 'wildoptions' defaults to "pum,tagfile"
""
"" |g:vimsyn_embed| defaults to "l" to enable Lua highlighting

set path+=**                    " Searches current directory recursively
set t_Co=256
set termguicolors
let g:rehash256 = 1
set showmatch                   " show matching 
set wrap                        " soft wrapping text
set linebreak
"set nolist
set ignorecase                  " case insensitive
set number relativenumber       " Display line numbers
set wildmode=longest,list       " get bash-like tab completions
set cursorline                  " highlight current line
set noshowmatch                 " no jumping for matching brackets

" from jess
set signcolumn=yes:2
set title
" set smartcase
set wildmode=longest:full,full
set nospell
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=4            " cursor won't go the bottom
set sidescrolloff=4
set nojoinspaces
set splitright
set confirm
set exrc
set updatetime=750
set redrawtime=10000  " allow more time for loading syntax on large files
" end jess

" from chris
set completeopt=menuone,noselect          " for cmp
set pumheight=10                          " pop up menu height
set showtabline=2                         " always show tabs
set smartindent
set timeoutlen=500                       " time to wait for a mapped sequence to complete
set undofile                              " enable persistent undo
set nowritebackup                         " disable editing a file that is being edited
set shiftwidth=2                          " spaces inserted for each indentation
set tabstop=2                             " 2 spaces for a tab

let g:markdown_folding = 0
set foldlevelstart=999
" folding using treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set iskeyword+=-
" end chris

filetype plugin indent on                       " allow auto-indenting depending on file type
set clipboard=unnamedplus                       " Copy/paste between vim and other programs
filetype plugin on
set backup                                      " keep a backup file

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a                 " enable mouse click
" set mouse=r                 " middle-click to paste

" 2022-04-24 global status ilne is 3
set laststatus=3

set showmode                              " No -- INSERT --
" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]])
