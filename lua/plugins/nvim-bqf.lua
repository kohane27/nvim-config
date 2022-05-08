-- https://github.com/mhinz/vim-grepper
vim.g.grepper = {tools = {'rg', 'grep'}, searchreg = 1}
vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

-- try `gsiw` under word
-- vim.cmd([[
--     nmap gs  <plug>(GrepperOperator)
--     xmap gs  <plug>(GrepperOperator)
-- ]])
