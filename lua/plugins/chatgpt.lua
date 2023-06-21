local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({})
