local status_ok, glow = pcall(require, "glow")
if not status_ok then
  print("glow not working")
end

glow.setup({})

local function sanitize_shell_string(input)
  local sanitized = input:gsub("'", "'\\''")
  return "'" .. sanitized .. "'"
end

local function markdown()
  local buf = vim.api.nvim_create_buf(false, true)

  local current_buf = vim.api.nvim_get_current_buf()
  local current_win = vim.api.nvim_get_current_win()

  local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
  local markdown = table.concat(lines, "\n")
  local sanitized = sanitize_shell_string(markdown)

  vim.cmd("rightbelow vert sbuffer " .. buf)

  local new_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_option(new_win, "number", false)
  vim.api.nvim_win_set_option(new_win, "cursorline", false)
  vim.api.nvim_win_set_option(new_win, "relativenumber", false)

  vim.fn.termopen("glow <( echo " .. sanitized .. ")\n")
end

vim.keymap.set("n", "<leader>m", markdown, {})
