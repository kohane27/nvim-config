return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.25
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.45
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    start_in_insert = true,
    insert_mappings = false,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
    direction = "float",       -- 'vertical' | 'horizontal' | 'tab' | 'float'
    close_on_exit = true,      -- close the terminal window when the process exits
    shade_terminals = false,   -- no different background color
    shade_filetypes = { "none", "fzf", "lspinfo", "mason", "lazy", "qf", "terminal", "dashboard", "spectre-panel" },
    float_opts = {
      border = "rounded",
      winblend = 0,
      width = math.floor(vim.o.columns * 0.9), -- 90% of screen width
      height = math.floor(vim.o.lines * 0.9), -- 90% of screen height
      row = math.floor((vim.o.lines - math.floor(vim.o.lines * 0.9)) / 2),
      col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.9)) / 2),
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    function _G.set_terminal_keymaps()
      -- escape
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0, noremap = true, silent = true })
      -- hide
      vim.keymap.set("t", "<C-t>", [[<Cmd>ToggleTermToggleAll<CR>]], { buffer = 0, noremap = true, silent = true })
      -- force close without prompting
      -- vim.keymap.set("t", "<C-t>", [[<Cmd>q!<CR>]], opts)
      -- vim.keymap.set("t", "<C-t>", [[<C-\><C-n><C-W>c]], opts)
    end

    --  mappings only for toggleterm
    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  end,
}
