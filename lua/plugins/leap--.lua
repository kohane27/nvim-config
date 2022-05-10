local status_ok, leap = pcall(require, "leap")
if not status_ok then
    print("leap failing")
end

leap.set_default_keymaps()

leap.setup {
    case_insensitive = true,
}
