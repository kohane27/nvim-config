vim.cmd([[
    let g:netrw_nogx = 1 " disable netrw's gx mapping.
    " nmap gx <Plug>(openbrowser-smart-search)
    " vmap gx <Plug>(openbrowser-smart-search)

    " Open URI under cursor.
    nmap gx <Plug>(openbrowser-open)
    " Open selected URI.
    vmap gx <Plug>(openbrowser-open)

    " Search word under cursor.
    " nmap map-you-like <Plug>(openbrowser-search)

    " If it looks like URI, Open URI under cursor.
    " Otherwise, Search word under cursor.
    " nmap map-you-like <Plug>(openbrowser-smart-search)
    " If it looks like URI, Open selected URI.
    " Otherwise, Search selected word.
    " vmap map-you-like <Plug>(openbrowser-smart-search) 
]])
