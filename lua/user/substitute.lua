local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
    return
end

substitute.setup({
    {
        on_substitute = nil,
        yank_substitued_text = false,
        range = {
            prefix = "",
        },
        exchange = {
            motion = false,
        },
    }
})

vim.api.nvim_set_keymap("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "cxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
