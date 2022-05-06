local status_ok, cutlass = pcall(require, "cutlass")
if not status_ok then
    return
end

cutlass.setup({
    -- lightspeed.nvim integration
    exclude = { "ns", "nS", "ndd", "nD" },
})
