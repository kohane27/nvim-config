local t = require("telescope")

local function live_grep_from_project_git_root(selection)
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
    }
  else
    opts = {
      cwd = selection.path,
    }
  end
  require("telescope.builtin").live_grep(opts)
end

t.setup({
  extensions = {
    zoxide = {
      mappings = {
        default = {
          -- remove below line and you'll cry
          -- before_action = function(selection) end,
          after_action = function(selection)
            for _, e in ipairs(require("bufferline").get_elements().elements) do
              vim.cmd("bd " .. e.id)
            end
            vim.cmd("Rooter")
            live_grep_from_project_git_root({ cwd = selection.path })
          end,
        },
        -- ["<C-s>"] = {
        --   before_action = function(selection) end,
        --   action = function(selection)
        --     vim.cmd.edit(selection.path)
        --   end,
        -- },
      },
    },
  },
})

-- Load the extension
t.load_extension("zoxide")

-- Add a mapping
vim.keymap.set("n", "<leader>fz", t.extensions.zoxide.list)
