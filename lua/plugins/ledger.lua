return {
  "ledger/vim-ledger",
  event = "VeryLazy",
  ft = "ledger",
  init = function()
    vim.g.caser_no_mappings = 1
    -- vim.g.ledger_extra_options = '--pedantic --explicit --check-payees'
    vim.g.ledger_date_format = "%Y-%m-%d"
    vim.g.ledger_align_at = 60
    vim.g.ledger_bin = "/usr/bin/hledger"
    vim.g.ledger_is_hledger = true
    -- String that will be used to fill the space between account name and amount in the foldtext.
    -- Set this to get some kind of lines or visual aid.
    -- vim.g.ledger_fillstring = '    -'
    vim.g.ledger_default_commodity = "$"
  end,

  config = function()
    vim.cmd([[
    au FileType ledger noremap <silent> { ?^\d<CR>
    au FileType ledger noremap <silent> } /^\d<CR>

    au FileType ledger inoremap <silent> <C-n> <C-r>=ledger#autocomplete_and_align()<CR>
    au FileType ledger noremap <silent> <C-s> :w \| edit \| :LedgerAlignBuffer<CR>

    "  set today's date of the current transaction.
    " `:call ledger#transaction_date_set(line('.'), "primary")
    au FileType ledger noremap <silent> o o<BS><ESC>i
    ]])
  end,
}
