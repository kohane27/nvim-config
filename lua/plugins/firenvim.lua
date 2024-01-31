return {
  "glacambre/firenvim",
  -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
  config = function()
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

        set ft=txt
        " `xremap` config.yml
        " C-w: C-KEY_BACKSPACE
        imap <C-BS> <C-W>

        " colorscheme nightfox
        " nightfly or material also ok
        " set guifont=FiraCode_Nerd_Font_Mono:h12

        " don't run null-ls
        let g:null_ls_disable = 1

        " don't use auto-session
        let g:auto_session_enabled = v:false

        au BufEnter github.com_*.txt set filetype=markdown
        au BufEnter leetcode.com_*.txt set filetype=javascript
    endif
]])
  end,
}
