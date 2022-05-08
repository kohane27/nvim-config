local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
    print("scrollview failing")
end

scrollview.setup({
    scrollview_on_startup = false,
    excluded_filetypes = { 'nerdtree', 'nvim-tree' },
    current_only = true,
    winblend = 75,
    base = 'buffer',
    column = 80
})
