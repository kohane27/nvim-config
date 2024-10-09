return {
  "glacambre/firenvim",
  -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
  config = function()
    vim.g.firenvim_config = {
      globalSettings = { alt = "all" },
      localSettings = {
        [".*"] = {
          cmdline = "neovim",
          content = "text",
          priority = 0,
          selector = "textarea",
          takeover = "never",
        },
      },
    }

    if vim.g.started_by_firenvim then
      vim.o.filetype = "txt"

      local map = require("core.utils").map
      -- `xremap` config.yml
      -- C-w: C-KEY_BACKSPACE
      map("i", "<C-BS>", "<C-W>")

      -- different from `legendary.nvim`'s
      map("n", "<leader>q", ":wq<CR>")

      -- colorscheme nightfox
      -- nightfly or material also ok
      vim.o.guifont = "FiraCode Nerd Font Mono:h11"

      vim.g.persisting = false
      vim.g.null_ls_disable = true
      vim.o.showtabline = 0
      vim.o.laststatus = 0

      vim.api.nvim_create_autocmd("BufEnter", {
        desc = "Generally use markdown syntax",
        pattern = "*.txt",
        callback = function()
          vim.opt.filetype = "markdown"
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "leetcode.com_*.txt",
        callback = function()
          vim.opt.filetype = "javascript"
        end,
      })
    end
  end,
}
