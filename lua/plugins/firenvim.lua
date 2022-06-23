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

    colorscheme nightfox
    " nightfly or material also ok
    set guifont=FiraCode_Nerd_Font_Mono:h11

    " don't run Startify
    let g:startify_disable_at_vimenter = 1
    " let g:startify_new_tab = 1

    " don't run null-ls
    let g:null_ls_disable = 1

    " don't use auto-session
    let g:auto_session_enabled = v:false

    au BufEnter github.com_*.txt set filetype=markdown
endif
]])
