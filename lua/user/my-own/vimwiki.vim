"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>   vimwiki settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vimwiki/vimwiki'

" text is shown normally; don't hide markers
let g:vimwiki_conceallevel=0
let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

"Vimwiki has a feature called "Temporary Wikis", that will treat every file with configured file-extension as a wiki. To disable this feature:
let g:vimwiki_global_ext = 0

let g:vimwiki_url_maxsave=0 " disable hide url
let g:vimwiki_use_mouse=1   " use mouse
