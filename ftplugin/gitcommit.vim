inoreabbrev <buffer> BB BREAKING CHANGE:
nnoremap    <buffer> i  i<C-r>=<sid>commit_type()<CR>

fun! s:commit_type()
  call complete(1, ['fix: ', 'chore: ', 'feat: ', 'refactor: ', 'docs: ', 'test: ', 'build: ', 'ci: ', 'style: ', 'perf: '])
  nunmap <buffer> i
  return ''
endfun
