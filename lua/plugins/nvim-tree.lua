return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- disable default netrw file explorer
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      local api = require("nvim-tree.api")
      vim.keymap.set("n", "<C-w>v", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "<C-w>s", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "<C-w>t", api.node.open.tab, opts("Open: New Tab"))
      vim.keymap.set("n", "o", api.node.open.preview, opts("Open Preview"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<C-r>", api.tree.reload, opts("Refresh"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
      vim.keymap.set("n", "dd", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "pp", api.fs.paste, opts("Paste"))
      vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Name"))
      vim.keymap.set("n", "yp", api.fs.copy.relative_path, opts("Copy Relative Path"))
      vim.keymap.set("n", "yP", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
      vim.keymap.set("n", "<C-q>", api.tree.close, opts("Close"))
      vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
      vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
      vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse"))
      vim.keymap.set("n", "L", api.tree.expand_all, opts("Expand All"))
      vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
      vim.keymap.set("n", "J", function()
        vim.cmd(":normal 5j")
      end, opts("move_down_fast"))

      vim.keymap.set("n", "K", function()
        vim.cmd(":normal 5k")
      end, opts("move_up_fast"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = false,
        update_root = false,
      },
      actions = {
        change_dir = {
          enable = false,
          global = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
      },
      filters = {
        custom = { "node_modules", ".cache", ".bin" },
      },
      notify = {
        threshold = vim.log.levels.ERROR,
      },
      view = {
        adaptive_size = true,
      },
    })
  end,
}
