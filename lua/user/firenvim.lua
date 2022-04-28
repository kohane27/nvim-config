vim.cmd([[

" doesn't seem to need it?
" set guifont=FiraCode_Nerd_Font_Mono:h11

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
        \ '<C-w>': 'default',
        \ '<C-n>': 'default',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

if exists('g:started_by_firenvim')

endif

]])
