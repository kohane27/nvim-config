" For Obsidian
" Emoji shortcuts for Obsidian Tasks
ab :due: 📅 
ab :don: ✅ 
ab :sta: 🛫 <c-r>=strftime("%Y-%m-%d")<cr>
ab :sch: ⏳ 

iabbrev dh 📅 <c-r>=strftime("%Y-%m-%d")<cr> ⏫<Esc>
iabbrev dm 📅 <c-r>=strftime("%Y-%m-%d")<cr> 🔼<Esc>
iabbrev dl 📅 <c-r>=strftime("%Y-%m-%d")<cr> 🔽<Esc>
iabbrev d ✅ <c-r>=strftime("%Y-%m-%d")<cr><Esc>

ab :n #tag ➕ <c-r>=strftime("%Y-%m-%d")<cr><Esc><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>i

nmap <leader>rf :silent !sh ~/.local/bin/neovim-to-anki.sh<CR>

ab :re: 🔁
ab :hp: ⏫
ab :mp: 🔼
ab :lp: 🔽

set nomodeline
