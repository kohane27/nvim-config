Plug 'romgrk/doom-one.vim'

augroup DoomOneOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme doom-one
augroup end

let g:doom_one_terminal_colors = v:true
set background=dark
" colorscheme doom-one

