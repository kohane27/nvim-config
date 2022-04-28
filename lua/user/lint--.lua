local status_ok, lint = pcall(require, "lint")
if not status_ok then
	vim.notify("lint failing")
	return
end

lint.linters_by_ft = {
	markdown = { "vale" },
	sh = { "shellcheck" },
}
