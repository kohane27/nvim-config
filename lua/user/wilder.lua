local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
    print("wilder.nvim failing")
end


wilder.setup({ modes = { ':', '/', '?' } })
