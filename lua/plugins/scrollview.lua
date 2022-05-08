local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
    print("scrollview failing")
end

scrollview.setup({
    on_startup = false,
    auto_mouse = true,
    current_only = true,
    excluded_filetypes = { 'nerdtree', 'nvim-tree' },
})

