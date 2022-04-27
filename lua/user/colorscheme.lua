vim.cmd [[
try
    set background=dark
    colorscheme doom-one
    " for vsplits
    set fillchars=vert:┃ 
    " for folds
    set fillchars+=fold:· 
    " TODO not working
    hi VertSplit guifg=#FF5C8F ctermfg=123

catch /^Vim\%((\a\+)\)\=:E185/
      set background=dark
      colorscheme default
endtry
]]
