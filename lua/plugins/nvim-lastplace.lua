local status_ok, lastplace = pcall(require, "nvim-lastplace")
if not status_ok then
  print("nvim-lastplace failing")
end

-- TODO https://github.com/ethanholz/nvim-lastplace/issues/16
lastplace.setup({})
