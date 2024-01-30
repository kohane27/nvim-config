local status_ok, typescript_tools = pcall(require, "typescript-tools")
if not status_ok then
  print("typescript-tools not working")
end

typescript_tools.setup({})
