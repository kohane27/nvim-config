local status_ok, navigator = pcall(require, "navigator")
if not status_ok then
    vim.notify("navigator failing")
end

navigator.setup()
