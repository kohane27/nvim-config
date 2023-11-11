local status_ok, gx = pcall(require, "gx")
if not status_ok then
  print("gx not working")
end

gx.setup({
  handlers = {
    plugin = false, -- open plugin links in lua (e.g. packer, lazy, ..)
    github = false, -- open github issues
    brewfile = false, -- open Homebrew formulaes and casks
    package_json = false, -- open dependencies from package.json
    search = false, -- search the web/selection on the web if nothing else is found
  },
})
