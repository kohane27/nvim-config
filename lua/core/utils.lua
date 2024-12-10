local M = {}

function M.get_current_buffer_content()
  local bufnr = vim.api.nvim_get_current_buf()
  -- Check if the buffer is loaded to avoid errors
  if vim.api.nvim_buf_is_loaded(bufnr) then
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
    local relative_filename = vim.fn.fnamemodify(filename, ":.")
    local formatted_content = string.format("`%s`:\n\n```%s\n%s\n```\n", relative_filename, filetype, content)
    -- Store the formatted content in the clipboard
    vim.fn.setreg("+", formatted_content)
    require("notify")("Current buffer content stored in clipboard")
  end
end

function M.get_all_buffer_content()
  local buffers_info = {}
  -- Iterate over all buffers
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    -- Check if the buffer is loaded to avoid errors
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
      if
        filetype ~= "markdown"
        and filetype ~= "incline"
        and filetype ~= "toggleterm"
        and filetype ~= "NvimTree"
        and filetype ~= "BqfPreviewFloatWin"
        and filetype ~= "BqfPreviewScrollBar"
      then
        local filename = vim.api.nvim_buf_get_name(bufnr)
        -- Only proceed if the filename is not empty
        if filename ~= "" then
          local relative_filename = vim.fn.fnamemodify(filename, ":.")
          local content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
          -- Only add to buffers_info if there is content
          if content ~= "" then
            -- Format the output
            table.insert(buffers_info, string.format("`%s`:\n\n```%s\n%s\n```\n", relative_filename, filetype, content))
          end
        end
      end
    end
  end
  -- Concatenate all buffer information
  local result = table.concat(buffers_info, "\n")
  -- Store the result in the clipboard
  vim.fn.setreg("+", result)
  require("notify")("All Buffer content stored in clipboard")
end

function M.get_visual_selection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

function M.gp_choose_agent(opts)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local action_state = require("telescope.actions.state")
  local actions = require("telescope.actions")
  opts = opts or {}

  local agents = {
    { description = "React Software Engineer", command = "React-Software-Engineer" },
    { description = "Arch Linux Expert", command = "Arch-Linux-Expert" },
    { description = "Neovim Expert", command = "Neovim-Expert" },
    { description = "Task Breakdown Helper", command = "Software-Engineering-Task-Breakdown-Helper" },
  }

  -- Create the picker
  pickers
    .new(opts, {
      prompt_title = "Choose an Agent",
      finder = finders.new_table({
        results = agents,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.description,
            ordinal = entry.description,
          }
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          local command = selection.value.command
          vim.api.nvim_exec("GpChatNew vsplit", false)
          vim.api.nvim_win_set_width(0, 100)
          vim.api.nvim_exec("GpAgent " .. command, false)
        end)
        return true
      end,
      -- initial_mode = "normal",
      layout_config = {
        width = 0.6,
        height = 0.6,
      },
    })
    :find()
end

function M.gp_chat_new_ulti()
  -- Get the name of the current buffer
  local buf_name = vim.api.nvim_buf_get_name(0)

  local dir = vim.fn.stdpath("data") .. "/gp/chats/"

  -- Check if the current buffer is a Markdown file in the gp chats directory
  if buf_name:match("^" .. dir .. ".+%.md$") then
    vim.cmd("bdelete")
  end
  vim.api.nvim_exec("GpChatNew vsplit", false)
  vim.api.nvim_win_set_width(0, 100)
  vim.api.nvim_exec("GpAgent Ultimate-Assistant", false)
end

function M.gp_chat_toggle()
  vim.api.nvim_exec("GpChatToggle vsplit", false)
  vim.api.nvim_win_set_width(0, 90)
end

-- ╭─────────────────────────────────────────────────────────╮
-- │ START: grep                                             │
-- ╰─────────────────────────────────────────────────────────╯
local function is_in_home_directory()
  if vim.fn.getcwd() == os.getenv("HOME") then
    print("Current directory is home. Exiting")
    return true
  end
  return false
end

local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

local common_glob_patterns = {
  "--glob=!**/.git/*",
  "--glob=!**/node_modules/*",
  "--glob=!**/.terraform/*",
  "--glob=!**/build/*",
  "--glob=!**/dist/*",
  "--glob=!**/yarn.lock",
  "--glob=!**/package-lock.json",
}

function M.live_grep_from_project_git_root(custom_opts)
  local opts = {}
  if is_in_home_directory() then
    return
  end
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
      vimgrep_arguments = vim.list_extend({
        "rg", -- use `ripgrep`
        "--ignore-case", -- all patterns will be searched case insensitively
        "--follow", -- follow symbolic links
        "--hidden", -- Search hidden files and directories
        -- "--no-ignore", -- do NOT respect .gitignore
        -- "--no-heading", -- don't group matches by each file
        -- "--with-filename", -- print the file path with the matched lines
        -- "--line-number", -- show line numbers
        -- "--column", -- show column numbers
      }, common_glob_patterns),
    }
  end
  if custom_opts then
    opts = vim.tbl_extend("force", opts, custom_opts)
  end
  require("telescope").extensions.egrepify.egrepify(opts)
end

function M.find_files_from_project_git_root()
  local opts = {}
  if is_in_home_directory() then
    return
  end
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
      hidden = true,
      find_command = vim.list_extend({
        "rg",
        "--ignore-case", -- all patterns will be searched case insensitively
        "--follow", -- follow symbolic links
        "--files", -- Print each file that would be searched without actually performing the search
        "--hidden", -- Search hidden files and directories
        -- "--no-ignore", -- do NOT respect .gitignore
      }, common_glob_patterns),
    }
  end
  require("telescope.builtin").find_files(opts)
end

-- ╭─────────────────────────────────────────────────────────╮
-- │ END: grep                                               │
-- ╰─────────────────────────────────────────────────────────╯

function M.markdown_preview()
  local buf = vim.api.nvim_create_buf(false, true)
  local current_buf = vim.api.nvim_get_current_buf()

  local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
  local markdownm = table.concat(lines, "\n")

  local sanitized = markdownm:gsub("'", "'\\''")
  local sanitized_final = "'" .. sanitized .. "'"

  vim.cmd("rightbelow vert sbuffer " .. buf)

  local new_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_option(new_win, "number", false)
  vim.api.nvim_win_set_option(new_win, "cursorline", false)
  vim.api.nvim_win_set_option(new_win, "relativenumber", false)

  vim.fn.termopen("glow <( echo " .. sanitized_final .. ")\n")
end

function M.toggle_global_scratchpad_md()
  -- Get the name of the current buffer
  local buf_name = vim.api.nvim_buf_get_name(0)

  -- Extract just the file name from the full path
  local file_name = vim.fn.fnamemodify(buf_name, ":t")

  -- Check if the current buffer is named 'scratchpad.md'
  if file_name == "scratchpad.md" then
    -- Close the current window
    vim.cmd("bdelete")
  else
    vim.cmd("vsplit " .. vim.fn.stdpath("config") .. "/scratchpad.md")
  end
end

function M.toggle_latest_scratchpad()
  -- Get the name of the current buffer
  local buf_name = vim.api.nvim_buf_get_name(0)

  local dir = os.getenv("HOME") .. "/Cloud/laptop/nvim/local/share/scratch.nvim/"

  -- Check if the current buffer is a scratchpad Markdown file
  if buf_name:match("^" .. dir .. ".+%.md$") then
    vim.cmd("bdelete")
  else
    -- only consider markdown files
    local files = vim.fn.readdir(dir, function(name)
      return name:match("%.md$") ~= nil
    end)
    local latest_mtime = -1
    local latest_file = nil

    -- Iterate over the files to find the latest one
    for _, file in ipairs(files) do
      local file_path = dir .. file
      local mtime = vim.fn.getftime(file_path)
      if mtime > latest_mtime then
        latest_mtime = mtime
        latest_file = file_path
      end
    end

    -- Open the latest file if it exists
    if latest_file then
      vim.cmd("vsplit " .. latest_file)
    else
      print("No files found in " .. dir)
    end
  end
end

-- function M.generate_random_chars()
--   local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
--   local char = {}
--   for i = 1, 50 do
--     local rand = math.random(#chars)
--     char[i] = chars:sub(rand, rand)
--   end
--   return table.concat(char)
-- end

function M.legendary_command_palette()
  require("legendary").find({
    formatter = function(item, _)
      -- remove first column
      local values = require("legendary.ui.format").default_format(item)
      values[1] = ""
      return values
    end,
  })
end

function M.execute_command(cmd)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, true, true), "t", true)
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.search_chats(chat_dir)
  local actions = require("telescope.actions")
  local builtin = require("telescope.builtin")

  builtin.find_files({
    cwd = chat_dir,
    attach_mappings = function(prompt_bufnr, map)
        -- Switch to live_grep on any character input
        -- stylua: ignore
        for _, char in ipairs({"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                             "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                             "1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*","(",")","-","_","=","+","[","]",
                             "{","}",";",":","'","\"",",","<",".",">","/","?"}) do
            map("i", char, function()
                actions.close(prompt_bufnr)
                require("core.utils").live_grep_from_project_git_root({
                    search_dirs = { chat_dir },
                    default_text = char
                })
            end)
        end
      return true
    end,
  })
end

function M.copy_project_structure()
  if is_in_home_directory() then
    return
  end
  if not is_git_repo() then
    vim.notify("Not in a git repository!", vim.log.levels.ERROR)
    return
  end

  local root_dir = get_git_root()
  vim.system({
    "sh",
    "-c",
    string.format("cd %s && eza --tree --level=10 --all --git-ignore | wl-copy", vim.fn.shellescape(root_dir)),
  })

  vim.notify("Project structure copied to clipboard.", vim.log.levels.INFO)
end

return M
