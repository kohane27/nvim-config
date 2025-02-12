-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set before initializing lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("plugins", {
  change_detection = {
    enabled = false, -- automatically check for config file changes and reload the UI
    notify = false, -- turn off notifications whenever plugin changes are made
  },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      -- https://www.lazyvim.org/configuration/lazy.nvim
      disabled_plugins = {
        "tohtml",
        "tutor",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit",
      },
    },
  },
})

-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.diagnostics")
