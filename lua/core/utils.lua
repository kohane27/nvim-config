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
      if filetype ~= "markdown" and filetype ~= "incline" then
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
    {
      description = "React Software Engineer",
      command = "React-Software-Engineer",
    },
    {
      description = "Task Breakdown Helper",
      command = "Software-Engineering-Task-Breakdown-Helper",
    },
    { description = "Arch Linux Expert", command = "Arch-Linux-Expert" },
    { description = "Neovim Expert", command = "Neovim-Expert" },
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
          vim.api.nvim_win_set_width(0, 80)
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

function M.live_grep_from_project_git_root()
  if vim.fn.getcwd() == os.getenv("HOME") then
    return print("Current directory is home. Exiting")
  end
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
      -- use `ripgrep`
      vimgrep_arguments = {
        "rg",
        "--follow", -- follow symbolic links
        "--hidden", -- search for hidden files
        "--ignore-case",
        -- "--no-heading", -- don't group matches by each file
        -- "--with-filename", -- print the file path with the matched lines
        -- "--line-number", -- show line numbers
        -- "--column", -- show column numbers

        -- excluded patterns
        "--glob=!**/.git/*",
        -- "--glob=!**/build/*",
        -- "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    }
  end
  -- If in visual mode, get the selected text and add it to opts
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "^V" then
    opts.default_text = require("core.utils").get_visual_selection()
  end
  -- require("telescope.builtin").live_grep(opts)
  require("telescope").extensions.egrepify.egrepify(opts)
end

function M.find_files_from_project_git_root()
  if vim.fn.getcwd() == os.getenv("HOME") then
    return print("Current directory is home. Exiting")
  end
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
      hidden = true,
      -- hidden files and directories are searched with `--hidden`
      find_command = {
        "rg",
        "--ignore-case",
        "--files",
        "--hidden",
        "--glob=!**/.git/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    }
  end
  require("telescope.builtin").find_files(opts)
end

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

function M.toggle_scratchpad()
  -- Get the name of the current buffer
  local buf_name = vim.api.nvim_buf_get_name(0)

  -- Extract just the file name from the full path
  local file_name = vim.fn.fnamemodify(buf_name, ":t")

  -- Check if the current buffer is named 'scratchPad.md'
  if file_name == "scratchPad.md" then
    -- Close the current window
    vim.cmd("close")
  else
    -- Run the ScratchPad command
    vim.cmd("ScratchPad")
  end
end

function M.generate_random_chars()
  local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local char = {}
  for i = 1, 50 do
    local rand = math.random(#chars)
    char[i] = chars:sub(rand, rand)
  end
  return table.concat(char)
end

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

return M
