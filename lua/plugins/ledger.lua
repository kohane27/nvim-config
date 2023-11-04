vim.cmd([[
" let g:ledger_extra_options = '--pedantic --explicit --check-payees'

let g:ledger_date_format = '%Y-%m-%d'
let g:ledger_align_at = 60
let g:ledger_bin = '/usr/bin/hledger'
let g:ledger_is_hledger = v:true

" String that will be used to fill the space between account name and amount in the foldtext.
" Set this to get some kind of lines or visual aid.
" let g:ledger_fillstring = '    -'

let g:ledger_default_commodity = '$'

"  ╭──────────────────────────────────────────────────────────╮
"  │ Commands                                                 │
"  ╰──────────────────────────────────────────────────────────╯

au FileType ledger noremap <silent> { ?^\d<CR>
au FileType ledger noremap <silent> } /^\d<CR>

au FileType ledger inoremap <silent> <C-n> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger noremap <silent> <C-s> :w \| edit \| :LedgerAlignBuffer<CR>

"  set today's date of the current transaction.
" `:call ledger#transaction_date_set(line('.'), "primary")
au FileType ledger noremap <silent> o <CR><ESC>i
]])
