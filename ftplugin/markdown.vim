" For Obsidian
" Emoji shortcuts for Obsidian Tasks
ab :due: 📅 
ab :don: ✅ 
ab :sta: 🛫 <c-r>=strftime("%Y-%m-%d")<cr>
" ab :sch: ⏳ 

ab :re: 🔁
ab :hp: ⏫
ab :mp: 🔼
ab :lp: 🔽

inoremap <buffer> td - [ ]  🛫 <c-r>=strftime("%Y-%m-%d")<cr><left><left><left><left><left><left><left><left><left><left><left><left><left>
inoremap <buffer> do ✅ <c-r>=strftime("%Y-%m-%d")<cr><Esc>:w<CR>
inoremap <buffer> du 📅 <c-r>=strftime("%Y-%m-%d")<cr><Esc>:w<CR>
inoremap <buffer> #t #tonight<Esc>:w<CR>
inoremap <buffer> #a #atwork<Esc>:w<CR>
inoremap <buffer> #o #Obsidian<Esc>:w<CR>
