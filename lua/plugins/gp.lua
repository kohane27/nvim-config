local status_ok, gp = pcall(require, "gp")
if not status_ok then
  print("gp not working")
end

gp.setup({
  openai_api_key = os.getenv("OPENAI_API_KEY"),
  cmd_prefix = "Gp",
  curl_params = { "--proxy", "http://127.0.0.1:8888" },

  chat_model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
  chat_topic_gen_model = "gpt-4-1106-preview",
  command_model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
})
