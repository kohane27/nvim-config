" For Obsidian
" Emoji shortcuts for Obsidian Tasks
" ab :due: 📅 
" ab :don: ✅ 
" ab :sta: 🛫 <c-r>=strftime("%Y-%m-%d")<cr>
" ab :sch: ⏳ 

" ab :re: 🔁
" ab :hp: ⏫
" ab :mp: 🔼
" ab :lp: 🔽

" iabbrev :h 📅 <c-r>=strftime("%Y-%m-%d")<cr> ⏫<Esc>
" iabbrev :m 📅 <c-r>=strftime("%Y-%m-%d")<cr> 🔼<Esc>
" iabbrev :l 📅 <c-r>=strftime("%Y-%m-%d")<cr> 🔽<Esc>
iabbrev <silent> :u 📅 <c-r>=strftime("%Y-%m-%d")<cr><Esc>
iabbrev <silent> :d ✅ <c-r>=strftime("%Y-%m-%d")<cr><Esc>

iabbrev <silent> :l # ➕ <c-r>=strftime("%Y-%m-%d")<cr> 🔽<Esc><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>i

iabbrev <silent> :m # ➕ <c-r>=strftime("%Y-%m-%d")<cr> 📅 <c-r>=strftime("%Y-%m-%d")<cr> 🔼<Esc><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>i

iabbrev <silent> :h # ➕ <c-r>=strftime("%Y-%m-%d")<cr> 📅 <c-r>=strftime("%Y-%m-%d")<cr> ⏫<Esc><Esc><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>i

set nomodeline
