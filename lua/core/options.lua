-----------------------------------------------------------
-- General Neovim settings and configuration
-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*
-----------------------------------------------------------

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

vim.cmd([[

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
set timeoutlen=500                        " time to wait for a mapped sequence to complete
set undofile                              " enable persistent undo
set nowritebackup                         " disable editing a file that is being edited
set shiftwidth=2                          " spaces inserted for each indentation
" set iskeyword+=-
" end chris
set inccommand=nosplit     " Live substitution
]])


-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show relative line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')

-- let g:markdown_folding = 0
-- set foldlevelstart=999
-- " folding using treesitter
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()

opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = false       -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 700        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

