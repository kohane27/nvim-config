vim.cmd([[

" neovim defaults
" 'backspace' defaults to "indent,eol,start"
" 'complete' excludes "i"
"
" 'sidescroll' defaults to 1
" 'tags' defaults to "./tags;,tags"
" 'ttimeoutlen' defaults to 50
" 'viewoptions' includes "unix,slash", excludes "options"
" 'viminfo' includes "!"
" 'wildoptions' defaults to "pum,tagfile"

set path+=**                    " Searches current directory recursively
set t_Co=256
let g:rehash256 = 1
set wrap                        " soft wrapping text
set wildmode=longest,list       " get bash-like tab completions
set cursorline                  " highlight current line

" from jess
set signcolumn=yes:2
set title
set wildmode=longest:full,full
set nospell
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=4            " cursor won't go the bottom
set sidescrolloff=4
set confirm
set exrc
set redrawtime=10000  " allow more time for loading syntax on large files
" end jess

" from chris
set pumheight=10                          " pop up menu height
set showmode                              " No -- INSERT --
set showtabline=2                         " always show tabs
set timeoutlen=500                       " time to wait for a mapped sequence to complete
set undofile                              " enable persistent undo
set nowritebackup                         " disable editing a file that is being edited
set shiftwidth=2                          " spaces inserted for each indentation

" set iskeyword+=-
" end chris

set backup                                      " keep a backup file

" set shortmess+=I           " Disable intro message
set inccommand=nosplit     " Live substitution


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
