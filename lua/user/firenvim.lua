vim.cmd([[
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
    let g:startify_disable_at_vimenter = 1
    au BufEnter github.com_*.txt set filetype=markdown
    set guifont=FiraCode_Nerd_Font_Mono:h11
    set shortmess=a
    set laststatus=0
endif
]])
